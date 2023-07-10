import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma, Products } from '@prisma/client';
import { CreateProductDto } from './dto/create-product.dto';
@Injectable()
export class ProductsService {
  constructor(private prismaService: PrismaService) {}

  async create(data: CreateProductDto): Promise<Products> {
    try {
      const { userId, ...productData } = data;

      const product = await this.prismaService.products.create({
        data: {
          ...productData,
          user: { connect: { id: userId } },
        },
      });

      return product;
    } catch (error) {
      console.error(error);
      if (error.code === 'P2002') {
        throw new HttpException(
          `A product with this ${error.meta.target[0]} already exists`,
          HttpStatus.CONFLICT,
        );
      }
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async update(params: {
    where: Prisma.ProductsWhereUniqueInput;
    data: Prisma.ProductsUpdateInput;
  }): Promise<Products> {
    const { where, data } = params;
    try {
      const updatedProduct = await this.prismaService.products.update({
        data,
        where,
      });

      return updatedProduct;
    } catch (error) {
      if (error.code === 'P2002') {
        throw new HttpException(
          `A product with this ${error.meta.target[0]} already exists`,
          HttpStatus.CONFLICT,
        );
      }

      if (error.code === 'P2025') {
        throw new HttpException(`Product not found`, HttpStatus.NOT_FOUND);
      }
      throw new HttpException(
        'Database error',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async findOne(
    where: Prisma.ProductsWhereUniqueInput,
  ): Promise<Products | null> {
    const product = await this.prismaService.products.findUnique({ where });

    if (!product) {
      throw new HttpException('Product not found', HttpStatus.NOT_FOUND);
    }
    return product;
  }

  async deleteProduct(
    where: Prisma.ProductsWhereUniqueInput,
  ): Promise<Products> {
    try {
      const result = await this.prismaService.products.delete({ where });

      return result;
    } catch (error) {
      if (error.code === 'P2025') {
        throw new HttpException(`Product not found`, HttpStatus.NOT_FOUND);
      }
      throw new HttpException(
        'Database error',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
}
