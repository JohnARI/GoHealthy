import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { AccountType, Prisma } from '@prisma/client';
import * as bcrypt from 'bcrypt';
import { PrismaService } from 'src/prisma/prisma.service';
import { UsersService } from '../users/users.service';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
    private prismaService: PrismaService,
  ) {}

  async validateUser(email: string, pass: string): Promise<any> {
    const user = await this.usersService.findOne({ email });

    if (!user || user.accountType !== AccountType.DEFAULT) {
      throw new HttpException('Unauthorized', HttpStatus.UNAUTHORIZED);
    }

    const isPassCorrect = await bcrypt.compare(pass, user.password);

    if (isPassCorrect) {
      return user;
    }

    throw new HttpException('Unauthorized', HttpStatus.UNAUTHORIZED);
  }

  async login(user: Prisma.UserWhereUniqueInput) {
    const payload = { email: user.email, id: user.id };
    const tokens = await this.generateTokens(payload);

    await this.createConnection(user.id, tokens.refresh_token);

    return tokens;
  }

  async logout(user: Prisma.UserWhereUniqueInput) {
    await this.prismaService.connection.deleteMany({
      where: { userId: user.id },
    });
  }

  async generateTokens(payload: { email: string; id: string }) {
    const access_token = this.jwtService.sign(payload);
    const refresh_token = this.jwtService.sign(payload, {
      secret: process.env.JWT_REFRESH_SECRET,
      expiresIn: '30d',
    });

    return { access_token, refresh_token };
  }

  async createConnection(id: string, refreshToken: string) {
    const hash = await bcrypt.hash(refreshToken, 10);

    await this.prismaService.connection.create({
      data: { userId: id, refreshToken: hash },
    });
  }

  async refreshToken(userId: string, refreshToken: string) {
    const user = await this.usersService.findOne(
      { id: userId },
      { connections: true },
    );

    if (!user || user.connections.length === 0) {
      throw new HttpException('Unauthorized', HttpStatus.UNAUTHORIZED);
    }

    const connection = user.connections.find(
      async (connection) =>
        await bcrypt.compare(refreshToken, connection.refreshToken),
    );

    if (!connection) {
      throw new HttpException('Unauthorized', HttpStatus.UNAUTHORIZED);
    }

    const payload = { email: user.email, id: user.id };

    return { access_token: this.jwtService.sign(payload) };
  }
}
