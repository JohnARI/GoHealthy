import { IsNotEmpty, Min, IsOptional } from 'class-validator';

export class CreateProductDto {
  @IsNotEmpty()
  title: string;

  @IsNotEmpty()
  type: 'whole' | 'processed' | 'other';

  @IsOptional()
  description?: string;

  @IsOptional()
  @Min(0)
  energy?: number;

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
  averageMass?: number;

  @IsOptional()
  imageBucketId?: string;

  @IsNotEmpty()
  userId: string;
}
