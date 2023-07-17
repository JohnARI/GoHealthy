import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { MealHistoryService } from './meal-history.service';
import { CreateMealHistoryDto } from './dto/create-meal-history.dto';
import { UpdateMealHistoryDto } from './dto/update-meal-history.dto';

@Controller('meal-history')
export class MealHistoryController {
  constructor(private readonly mealHistoryService: MealHistoryService) {}

  @Post()
  create(@Body() createMealHistoryDto: CreateMealHistoryDto) {
    return this.mealHistoryService.create(createMealHistoryDto);
  }

  @Get()
  findAll() {
    return this.mealHistoryService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.mealHistoryService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateMealHistoryDto: UpdateMealHistoryDto,
  ) {
    return this.mealHistoryService.update(+id, updateMealHistoryDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.mealHistoryService.remove(+id);
  }
}
