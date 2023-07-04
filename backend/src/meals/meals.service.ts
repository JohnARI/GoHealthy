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
      const { title, products } = data;

      const meal = await this.prismaService.meals.create({
        data: {
          title,
          products: {
            create: products.map((product) => ({
              weightInGrams: product.weightInGrams,
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

  // findAll() {
  //   return `This action returns all meals`;
  // }

  // findOne(id: string) {
  //   return `This action returns a #${id} meal`;
  // }

  // update(id: string, updateMealDto: UpdateMealDto) {
  //   return `This action updates a #${id} meal`;
  // }

  // remove(id: string) {
  //   return `This action removes a #${id} meal`;
  // }
}
