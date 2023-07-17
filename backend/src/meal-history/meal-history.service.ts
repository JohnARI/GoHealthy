import { Injectable } from '@nestjs/common';
import { CreateMealHistoryDto } from './dto/create-meal-history.dto';
import { UpdateMealHistoryDto } from './dto/update-meal-history.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class MealHistoryService {
  constructor(private prismaService: PrismaService) {}

  async create(createMealHistoryDto: CreateMealHistoryDto) {
    const { meal } = createMealHistoryDto;
    return await this.prismaService.mealHistory.create({
      data: {
        mealType: createMealHistoryDto.mealType,
        date: createMealHistoryDto.date,
        meal: {
          create: meal.map((product) => ({
            productId: product.id,
            weightInGrams: product.weightInGrams,
          })),
        },
        include: {
          meal: true,
        },
      },
    });
  }

  findAll() {
    return `This action returns all mealHistory`;
  }

  findOne(id: number) {
    return `This action returns a #${id} mealHistory`;
  }

  update(id: number, updateMealHistoryDto: UpdateMealHistoryDto) {
    return `This action updates a #${id} mealHistory`;
  }

  remove(id: number) {
    return `This action removes a #${id} mealHistory`;
  }
}
