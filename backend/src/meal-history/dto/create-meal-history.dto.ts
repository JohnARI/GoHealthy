import { Prisma, MealType } from '@prisma/client';
import { IsArray, IsNotEmpty } from 'class-validator';

export class CreateMealHistoryDto {
  @IsNotEmpty()
  @IsArray()
  meal: Prisma.MealOnProductCreateInput[];

  @IsNotEmpty()
  mealType: MealType;

  @IsNotEmpty()
  date: Date;
}
