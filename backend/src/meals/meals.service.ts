import {
  HttpException,
  HttpStatus,
  Injectable,
  NotFoundException,
} from '@nestjs/common';

import { UpdateMealDto } from './dto/update-meal.dto';
import { PrismaService } from '../prisma/prisma.service';
import { Meal, MealType, Prisma } from '@prisma/client';
import { CreateMealDto } from './dto/create-meal.dto';

@Injectable()
export class MealsService {
  constructor(private prismaService: PrismaService) {}

  async create(userId: string, data: CreateMealDto): Promise<any> {
    return await this.prismaService.mealHistory.update({
      where: { userId: userId },
      data: {
        meals: {
          create: {
            title: data.title,
            massInGrams: data.mass,
            mealType: data.mealType,
            products: {
              create: data.products.map((product) => ({
                title: product.product.title,
              })),
            },
          },
        },
      },
    });
  }

  async findAll(userId: string, query: any) {
    const mealHistory = await this.prismaService.mealHistory.findUnique({
      where: { userId },
    });

    const { dateFrom, dateTo, ...rest } = query;

    return await this.prismaService.meal.findMany({
      where: {
        mealHistoryId: mealHistory.id,
        ...rest,
        createdAt: { gte: dateFrom, lte: dateTo },
      },
      include: {
        products: true,
      },
    });
  }

  async findOne(id: string) {
    return await this.prismaService.meal.findUnique({
      where: { id },
      include: {
        products: true,
      },
    });
  }

  async update(id: string, data: UpdateMealDto): Promise<Meal> {
    return await this.prismaService.meal.update({
      where: { id },
      data,
    });
  }

  async remove(id: string): Promise<void> {
    await this.prismaService.meal.delete({
      where: { id },
    });
  }
}
