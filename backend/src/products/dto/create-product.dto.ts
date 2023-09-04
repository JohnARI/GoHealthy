import { IsNotEmpty, Min, IsOptional } from 'class-validator';

export class CreateProductDto {
  @IsNotEmpty()
  title: string;

  @IsOptional()
  @Min(0)
  calories?: number;

  @IsOptional()
  @Min(0)
  fat?: number;

  @IsOptional()
  @Min(0)
  saturatedFat?: number;

  @IsOptional()
  @Min(0)
  carbohydrates?: number;

  @IsOptional()
  @Min(0)
  sugars?: number;

  @IsOptional()
  @Min(0)
  protein?: number;

  @IsOptional()
  @Min(0)
  fiber?: number;

  @IsOptional()
  @Min(0)
  salt?: number;

  @IsOptional()
  @Min(0)
  mass?: number;

  @IsOptional()
  EAN?: string;
}
