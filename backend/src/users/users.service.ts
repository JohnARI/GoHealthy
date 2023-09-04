import { Injectable } from '@nestjs/common';
import { Connection, Prisma, User } from '@prisma/client';
import * as bcrypt from 'bcrypt';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class UsersService {
  constructor(private prismaService: PrismaService) {}

  async create(data: Prisma.UserCreateInput): Promise<User> {
    const user = {
      ...data,
      password: await bcrypt.hash(data.password, 10),
      mealHistory: {
        create: {
          meals: {
            create: [],
          },
        },
      },
    };

    return await this.prismaService.user.create({ data: user });
  }

  async update(params: {
    where: Prisma.UserWhereUniqueInput;
    data: Prisma.UserUpdateInput;
  }): Promise<User> {
    return await this.prismaService.user.update({ ...params });
  }

  async findOne(
    where: Prisma.UserWhereUniqueInput,
    includes?: Prisma.UserInclude,
  ): Promise<User & { connections?: Array<Connection> }> {
    return await this.prismaService.user.findUnique({
      where,
      include: includes,
    });
  }

  async delete(where: Prisma.UserWhereUniqueInput): Promise<User> {
    return await this.prismaService.user.delete({ where });
  }
}
