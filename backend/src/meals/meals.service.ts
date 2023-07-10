import { HttpException, HttpStatus, Injectable } from '@nestjs/common';

import { UpdateMealDto } from './dto/update-meal.dto';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma, Meals } from '@prisma/client';
import { CreateMealDto } from './dto/create-meal.dto';

@Injectable()
export class MealsService {
  constructor(private prismaService: PrismaService) {}

  async create(data: CreateMealDto): Promise<Meals> {
    try {
      const { title, products, userId } = data;

      const meal = await this.prismaService.meals.create({
        data: {
          title,
          products: {
            create: products.map((product) => ({
              weightInGrams: product.weightInGrams,
              productId: product.id,
              userId,
              product: { connect: { id: product.id } },
            })),
          },
        },
        include: {
          products: true,
        },
      });

      return meal;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async findAll() {
    const meals = await this.prismaService.meals.findMany({
      include: {
        products: true,
      },
    });
    return meals;
  }

  async findOne(id: string) {
    try {
      const meal = await this.prismaService.meals.findUnique({
        where: { id },
        include: {
          products: true,
        },
      });
      return meal;
    } catch (error) {
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  // update(id: string, updateMealDto: UpdateMealDto) {
  //   return `This action updates a #${id} meal`;
  // }

  async remove(id: string) {
    try {
      await this.prismaService.meals.delete({
        where: { id },
      });
      const meals = await this.prismaService.meals.findMany({
        include: {
          products: true,
        },
      });
      return meals;
      // return HttpStatus.OK;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
}
