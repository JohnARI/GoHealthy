import { Module } from '@nestjs/common';
import { MealHistoryService } from './meal-history.service';
import { MealHistoryController } from './meal-history.controller';
import { PrismaService } from '../prisma/prisma.service';

@Module({
  controllers: [MealHistoryController],
  providers: [MealHistoryService, PrismaService],
  exports: [MealHistoryService],
})
export class MealHistoryModule {}
