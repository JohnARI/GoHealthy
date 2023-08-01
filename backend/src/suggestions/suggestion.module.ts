import { Module } from '@nestjs/common';
import { SuggestionService } from './suggestion.service';
import { SuggestionController } from './suggestion.controller';
import { PrismaService } from 'src/prisma/prisma.service';
import { BodyBuildService } from 'src/body-build/body-build.service';

@Module({
  controllers: [SuggestionController],
  providers: [SuggestionService, PrismaService, BodyBuildService],
  exports: [SuggestionService],
})
export class SuggestionModule {}
