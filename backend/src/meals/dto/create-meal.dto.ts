import {
  IsString,
  IsArray,
  IsNotEmpty,
  ValidateNested,
  IsOptional,
} from 'class-validator';
import { Prisma, MealType } from '@prisma/client';

export class CreateMealDto {
  @IsNotEmpty()
  @IsString()
  title: string;

  @IsNotEmpty()
  @IsArray()
  // @ValidateNested({ each: true }) // Valide chaque élément de la liste
  products: any;

  @IsNotEmpty()
  mass: number;

  @IsNotEmpty()
  mealType: MealType;
}
