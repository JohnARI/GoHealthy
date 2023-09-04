import { Module } from '@nestjs/common';
import { BodyBuildService } from './body-build.service';
import { BodyBuildController } from './body-build.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  controllers: [BodyBuildController],
  providers: [BodyBuildService, PrismaService],
  exports: [BodyBuildService],
})
export class BodyBuildModule {}
