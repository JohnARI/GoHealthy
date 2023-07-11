import { IsNotEmpty, IsString } from 'class-validator';
import { ActivityLevel, Sex } from '@prisma/client';

export class CreateBodyBuildDto {
  @IsNotEmpty()
  weightGoal: number;

  @IsNotEmpty()
  currentWeight: number;

  @IsNotEmpty()
  activityLevel: ActivityLevel;

  @IsNotEmpty()
  height: number;

  @IsNotEmpty()
  age: number;

  @IsNotEmpty()
  @IsString()
  userId: string;

  @IsNotEmpty()
  @IsString()
  sexe: Sex;
}
