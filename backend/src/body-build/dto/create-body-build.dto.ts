import { IsNotEmpty, IsString } from 'class-validator';
import { ActivityLevel, Diet, DietIntensity, Sex } from '@prisma/client';

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
  sexe: Sex;

  @IsNotEmpty()
  @IsString()
  diet: Diet;

  @IsNotEmpty()
  @IsString()
  dietIntensity: DietIntensity;
}
