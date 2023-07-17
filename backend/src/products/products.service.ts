import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma, Products } from '@prisma/client';
import { CreateProductDto } from './dto/create-product.dto';

@Injectable()
export class ProductsService {
  constructor(private prismaService: PrismaService) {}

  async findExistingProductByEAN(ean: number): Promise<Products | null> {
    const existingProduct = await this.prismaService.products.findFirst({
      where: {
        EAN: ean,
      },
    });

    return existingProduct;
  }

  async createProduct(data: CreateProductDto): Promise<Products> {
    try {
      const { userId, ...productData } = data;
      if (data.EAN) {
        this.findExistingProductByEAN(data.EAN);
      }
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
        'Database error',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async updateProduct(
    id: string,
    data: Partial<Prisma.ProductsUpdateInput>,
  ): Promise<Products> {
    try {
      const updatedProduct = await this.prismaService.products.update({
        where: { id },
        data,
      });

      return updatedProduct;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        'Database error',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async getProductById(id: string): Promise<Products | null> {
    const product = await this.prismaService.products.findUnique({
      where: { id },
    });

    if (!product) {
      throw new HttpException('Product not found', HttpStatus.NOT_FOUND);
    }

    return product;
  }

  async deleteProduct(id: string): Promise<Products> {
    try {
      const result = await this.prismaService.products.delete({
        where: { id },
      });

      return result;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        'Database error',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  // Ajoutez d'autres méthodes de service nécessaires selon vos besoins
}
