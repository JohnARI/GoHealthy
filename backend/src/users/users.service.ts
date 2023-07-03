import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Connection, Prisma, User } from '@prisma/client';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsersService {
  constructor(private prismaService: PrismaService) {}

  async create(data: Prisma.UserCreateInput): Promise<User> {
    const user = { ...data, password: await bcrypt.hash(data.password, 10) };

    try {
      const result = await this.prismaService.user.create({ data: user });

      return result;
    } catch (error) {
      throw new HttpException(
        `Database error with field: ${error.meta.target[0]}`,
        HttpStatus.CONFLICT,
      );
    }
  }

  update(params: {
    where: Prisma.UserWhereUniqueInput;
    data: Prisma.UserUpdateInput;
  }): Promise<User> {
    const { where, data } = params;

    return this.prismaService.user.update({
      data,
      where,
    });
  }

  async findOne(
    where: Prisma.UserWhereUniqueInput,
    includes?: Prisma.UserInclude,
  ): Promise<User & { connections?: Array<Connection> }> {
    const user = await this.prismaService.user.findUnique({
      where,
      include: includes,
    });

    if (!user) {
      throw new HttpException('User not found', HttpStatus.NOT_FOUND);
    }

    return user;
  }

  async delete(where: Prisma.UserWhereUniqueInput): Promise<User> {
    const user = await this.prismaService.user.delete({ where });

    if (!user) {
      throw new HttpException('User not found', HttpStatus.NOT_FOUND);
    }

    return user;
  }
}
