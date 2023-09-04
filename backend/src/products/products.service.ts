import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class ProductsService {
  constructor(private prismaService: PrismaService) {}

  async create(data: Prisma.ProductCreateInput): Promise<any> {
    return await this.prismaService.product.create({
      data: { ...data, title: data.title.trim().toLowerCase() },
    });
  }

  // unused for now
  async findAll(includes?: Prisma.ProductInclude): Promise<any> {}

  async findOne(where: Prisma.ProductWhereUniqueInput): Promise<any> {
    return await this.prismaService.product.findUnique({ where });
  }

  async update(id: string, data: Prisma.ProductUpdateInput): Promise<any> {
    return await this.prismaService.product.update({ where: { id }, data });
  }

  async delete(where: Prisma.ProductWhereUniqueInput): Promise<any> {
    return await this.prismaService.product.deleteMany({ where });
  }
}
