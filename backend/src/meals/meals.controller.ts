import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  HttpCode,
  ParseUUIDPipe,
  Request,
  Query,
} from '@nestjs/common';
import { MealsService } from './meals.service';
import { CreateMealDto } from './dto/create-meal.dto';
import { UpdateMealDto } from './dto/update-meal.dto';
import { SkipThrottle } from '@nestjs/throttler';
import { JwtAccessGuard } from 'src/auth/guards/jwt-access.guard';
import { RequestWithUserUniqueInput } from 'src/types/request.type';
import { GetMealDto } from './dto/get-meal-dto';

@SkipThrottle()
@Controller('meals')
export class MealsController {
  constructor(private readonly mealsService: MealsService) {}

  @UseGuards(JwtAccessGuard)
  @Post()
  async create(
    @Request() req: RequestWithUserUniqueInput,
    @Body() createMealDto: CreateMealDto,
  ) {
    return this.mealsService.create(req.user.id, createMealDto);
  }

  @UseGuards(JwtAccessGuard)
  @Get('history')
  findAll(
    @Request() req: RequestWithUserUniqueInput,
    @Query() query: GetMealDto,
  ) {
    return this.mealsService.findAll(req.user.id, query);
  }

  @UseGuards(JwtAccessGuard)
  @Get(':id')
  findOne(@Param('id', ParseUUIDPipe) id: string) {
    return this.mealsService.findOne(id);
  }

  @UseGuards(JwtAccessGuard)
  @Patch(':id')
  update(
    @Param('id', ParseUUIDPipe) id: string,
    @Body() updateMealDto: UpdateMealDto,
  ) {
    return this.mealsService.update(id, updateMealDto);
  }

  @UseGuards(JwtAccessGuard)
  @Delete(':id')
  @HttpCode(204)
  remove(@Param('id', ParseUUIDPipe) id: string) {
    return this.mealsService.remove(id);
  }
}
