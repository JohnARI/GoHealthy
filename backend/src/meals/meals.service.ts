import {
  HttpException,
  HttpStatus,
  Injectable,
  NotFoundException,
} from '@nestjs/common';

import { UpdateMealDto } from './dto/update-meal.dto';
import { PrismaService } from '../prisma/prisma.service';
import { Meals } from '@prisma/client';
import { CreateMealDto } from './dto/create-meal.dto';

@Injectable()
export class MealsService {
  constructor(private prismaService: PrismaService) {}

  async create(data: CreateMealDto): Promise<Meals> {
    try {
      const { title, products, userId, mealType } = data;

      const meal = await this.prismaService.meals.create({
        data: {
          title,
          mealType,
          products: {
            create: products.map((product) => ({
              productId: product.id,
              weightInGrams: product.weightInGrams,
              userId,
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

  async update(id: string, data: UpdateMealDto): Promise<Meals> {
    try {
      const { title, products, userId } = data;

      const existingMeal = await this.prismaService.meals.findUnique({
        where: { id },
        include: { products: true },
      });

      if (!existingMeal) {
        throw new NotFoundException('Meal not found');
      }

      // Supprimer les produits existants du repas
      await this.prismaService.mealOnProduct.deleteMany({
        where: { mealId: id },
      });

      // Mettre à jour le titre du repas
      const updatedMeal = await this.prismaService.meals.update({
        where: { id },
        data: { title },
        include: { products: true },
      });

      // Créer les nouveaux produits pour le repas
      const createdProducts = await Promise.all(
        products.map((product) =>
          this.prismaService.mealOnProduct.create({
            data: {
              weightInGrams: product.weightInGrams,
              product: { connect: { id: product.id } },
              meal: { connect: { id } },
              user: { connect: { id: userId } },
            },
          }),
        ),
      );

      updatedMeal.products = createdProducts;

      return updatedMeal;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async remove(id: string): Promise<void> {
    try {
      const meal = await this.prismaService.meals.findUnique({
        where: { id },
        include: { products: true }, // Inclure les produits associés pour supprimer les enregistrements dans MealOnProduct
      });

      if (!meal) {
        throw new NotFoundException('Meal not found');
      }

      // Supprimer les enregistrements associés dans MealOnProduct
      await this.prismaService.mealOnProduct.deleteMany({
        where: { mealId: meal.id },
      });

      // Supprimer le repas lui-même
      await this.prismaService.meals.delete({
        where: { id },
      });
    } catch (error) {
      console.error(error);
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
}
