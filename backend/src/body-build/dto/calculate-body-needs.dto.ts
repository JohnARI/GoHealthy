import { IsNotEmpty } from 'class-validator';

export class calculateBodyNeedsDto {
  @IsNotEmpty()
  calories: number;

  @IsNotEmpty()
  proteins: number;

  @IsNotEmpty()
  carbohydrates: number;

  @IsNotEmpty()
  lipids: number;
}
