import {
  ForbiddenException,
  HttpException,
  HttpStatus,
  Injectable,
} from '@nestjs/common';
import { UsersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma, AccountType } from '@prisma/client';

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
      throw new ForbiddenException('Access Denied');
    }

    const isPassCorrect = await bcrypt.compare(pass, user.password);

    if (user && isPassCorrect) {
      return user;
    }

    return null;
  }

  async login(user: any) {
    const payload = { email: user.email, id: user.id };
    const tokens = await this.generateTokens(payload);

    await this.createConnection(user.id, tokens.refresh_token);

    return tokens;
  }

  async googleLogin(user: any) {
    const dbUser = await this.usersService.findOne({ email: user.email });

    if (dbUser && dbUser.accountType !== AccountType.GOOGLE)
      return new HttpException(
        'This email is already registered with another account',
        HttpStatus.CONFLICT,
      );

    const finalUser =
      dbUser ||
      (await this.usersService.create({
        ...user,
        accountType: AccountType.GOOGLE,
        password: '',
      }));

    const payload = { email: finalUser.email, id: finalUser.id };
    const tokens = await this.generateTokens(payload);

    await this.createConnection(finalUser.id, tokens.refresh_token);

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

    if (!user || user.connections.length === 0)
      throw new ForbiddenException('Access Denied');

    const connection = user.connections.find(
      async (connection) =>
        await bcrypt.compare(refreshToken, connection.refreshToken),
    );

    if (!connection) throw new ForbiddenException('Access Denied');

    const payload = { email: user.email, id: user.id };

    return { access_token: this.jwtService.sign(payload) };
  }
}
