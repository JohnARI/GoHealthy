import {
  IsString,
  IsArray,
  IsNotEmpty,
  ValidateNested,
  IsOptional,
} from 'class-validator';
import { Prisma } from '@prisma/client';
export class CreateMealDto {
  @IsNotEmpty()
  @IsString()
  title: string;

  @IsNotEmpty()
  @IsArray()
  @ValidateNested({ each: true }) // Valide chaque élément de la liste
  products: Prisma.MealOnProductCreateInput[];

  @IsNotEmpty()
  @IsString()
  userId: string;

  @IsOptional()
  imagebucketId?: string;
}