import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma, Products } from '@prisma/client';
@Injectable()
export class ProductsService {
  constructor(private prismaService: PrismaService) {}
  async create(data: Prisma.ProductsCreateInput): Promise<void> {
    try {
      await this.prismaService.products.create({ data });
    } catch (error) {
      throw new Error('One or more fields are missing');
    }
  }

  async update(params: {
    where: Prisma.ProductsWhereUniqueInput;
    data: Prisma.ProductsUpdateInput;
  }): Promise<Products> {
    const { where, data } = params;
    try {
      return this.prismaService.products.update({
        data,
        where,
      });
    } catch (e) {
      throw new Error('Bad Request');
    }
  }

  async findOne(
    where: Prisma.ProductsWhereUniqueInput,
  ): Promise<Products | null> {
    try {
      return this.prismaService.products.findUnique({ where });
    } catch (e) {
      throw new Error('Product not found');
    }
  }

  async deleteProduct(
    where: Prisma.ProductsWhereUniqueInput,
  ): Promise<Products> {
    try {
      return this.prismaService.products.delete({ where });
    } catch (e) {
      throw new Error('Product not found');
    }
  }
}
