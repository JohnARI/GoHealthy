import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateBodyBuildDto } from './dto/create-body-build.dto';
import { UpdateBodyBuildDto } from './dto/update-body-build.dto';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { calculateNeeds } from 'src/utils/calculators/calculators.needs';

@Injectable()
export class BodyBuildService {
  constructor(private prismaService: PrismaService) {}

  async create(createBodyBuildDto: CreateBodyBuildDto, userId: string) {
    return await this.prismaService.bodyBuild.create({
      data: {
        ...createBodyBuildDto,
        user: {
          connect: {
            id: userId,
          },
        },
        diet: createBodyBuildDto.diet,
        dietIntensity: createBodyBuildDto.dietIntensity,
      },
    });
  }

  async findOne(where: any, includes?: Prisma.BodyBuildInclude) {
    return await this.prismaService.bodyBuild.findUnique({
      where,
      include: includes,
    });
  }

  async update(where: any, updateBodyBuildDto: UpdateBodyBuildDto) {
    return await this.prismaService.bodyBuild.update({
      where,
      data: updateBodyBuildDto,
    });
  }

  async createNeeds(createBodyBuildDto: CreateBodyBuildDto, bodyId: string) {
    var needs = calculateNeeds(createBodyBuildDto);
    try {
      await this.prismaService.dailyNeeds.create({
        data: {
          body: {
            connect: {
              id: bodyId,
            },
          },
          calories: needs.calories,
          proteins: needs.proteins,
          carbohydrates: needs.carbohydrates,
          lipids: needs.lipids,
        },
      });
    } catch (error) {
      console.error(error);
      return new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async updateNeeds(bodyId: string) {
    try {
      const bodyBuild = await this.findOne(bodyId);
      if (!bodyBuild) {
        throw new Error('BodyBuild not found');
      }
      const needs = calculateNeeds(bodyBuild);
      const bodyNeeds = await this.prismaService.dailyNeeds.update({
        where: { bodyId: bodyBuild.id },
        data: {
          calories: needs.calories,
          proteins: needs.proteins,
          carbohydrates: needs.carbohydrates,
          lipids: needs.lipids,
        },
      });
      return bodyNeeds;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        `Database error: ${error.message} `,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
}
