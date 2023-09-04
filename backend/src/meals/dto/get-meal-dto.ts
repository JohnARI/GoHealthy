import { PartialType } from '@nestjs/swagger';
import { CreateMealDto } from './create-meal.dto';

export class GetMealDto extends PartialType(CreateMealDto) {
  dateFrom: Date;
  dateTo: Date;
}
