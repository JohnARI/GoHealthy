import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Connection, Prisma, User } from '@prisma/client';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsersService {
  constructor(private prismaService: PrismaService) {}

  async create(data: Prisma.UserCreateInput): Promise<User> {
    const user = { ...data, password: await bcrypt.hash(data.password, 10) };

    return this.prismaService.user.create({ data: user });
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

  findOne(
    where: Prisma.UserWhereUniqueInput,
    includes?: Prisma.UserInclude,
  ): Promise<(User & { connections?: Array<Connection> }) | null> {
    return this.prismaService.user.findUnique({
      where,
      include: includes,
    });
  }
}
