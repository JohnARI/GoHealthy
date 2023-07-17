import { PartialType } from '@nestjs/swagger';
import { CreateMealHistoryDto } from './create-meal-history.dto';

export class UpdateMealHistoryDto extends PartialType(CreateMealHistoryDto) {}
