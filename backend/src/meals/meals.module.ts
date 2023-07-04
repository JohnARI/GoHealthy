import { Module } from '@nestjs/common';
import { MealsService } from './meals.service';
import { MealsController } from './meals.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  controllers: [MealsController],
  providers: [MealsService, PrismaService],
  exports: [MealsService],
})
export class MealsModule {}
