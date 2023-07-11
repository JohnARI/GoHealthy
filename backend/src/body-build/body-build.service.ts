import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateBodyBuildDto } from './dto/create-body-build.dto';
import { UpdateBodyBuildDto } from './dto/update-body-build.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class BodyBuildService {
  constructor(private prismaService: PrismaService) {}

  async create(createBodyBuildDto: CreateBodyBuildDto) {
    try {
      const user = await this.prismaService.user.findUnique({
        where: { id: createBodyBuildDto.userId },
      });
      if (!user) {
        throw new Error('User not found');
      }

      const bodyBuild = await this.prismaService.bodyBuild.create({
        data: {
          weightGoal: createBodyBuildDto.weightGoal,
          currentWeight: createBodyBuildDto.currentWeight,
          activityLevel: createBodyBuildDto.activityLevel,
          height: createBodyBuildDto.height,
          age: createBodyBuildDto.age,
          sexe: createBodyBuildDto.sexe,
          user: {
            connect: {
              id: createBodyBuildDto.userId,
            },
          },
        },
      });
      return bodyBuild;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async findAll() {
    try {
      const bodyBuilds = await this.prismaService.bodyBuild.findMany({
        include: {
          user: true,
        },
      });
      return bodyBuilds;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  findOne(id: string) {
    try {
      const bodyBuild = this.prismaService.bodyBuild.findUnique({
        where: { id },
        include: {
          user: true,
        },
      });
      return bodyBuild;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  update(id: string, updateBodyBuildDto: UpdateBodyBuildDto) {
    try {
      const bodyBuild = this.prismaService.bodyBuild.update({
        where: { id },
        data: {
          weightGoal: updateBodyBuildDto.weightGoal,
          currentWeight: updateBodyBuildDto.currentWeight,
          activityLevel: updateBodyBuildDto.activityLevel,
          height: updateBodyBuildDto.height,
          age: updateBodyBuildDto.age,
          sexe: updateBodyBuildDto.sexe,
        },
      });
      return bodyBuild;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  remove(id: string) {
    try {
      const bodyBuild = this.prismaService.bodyBuild.delete({
        where: { id },
      });
      return bodyBuild;
    } catch (error) {
      console.error(error);
      throw new HttpException(
        `Database error: ${error.message}`,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
}
