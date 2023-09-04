import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  UseGuards,
  Request,
  UseInterceptors,
  ClassSerializerInterceptor,
} from '@nestjs/common';
import { BodyBuildService } from './body-build.service';
import { CreateBodyBuildDto } from './dto/create-body-build.dto';
import { UpdateBodyBuildDto } from './dto/update-body-build.dto';
import { JwtAccessGuard } from 'src/auth/guards/jwt-access.guard';
import { RequestWithUserUniqueInput } from 'src/types/request.type';

// TODO: Should serialize user.password and user.id
@UseInterceptors(ClassSerializerInterceptor)
@Controller('body-build')
export class BodyBuildController {
  constructor(private readonly bodyBuildService: BodyBuildService) {}

  @UseGuards(JwtAccessGuard)
  @Post()
  async create(
    @Request() req: RequestWithUserUniqueInput,
    @Body() createBodyBuildDto: CreateBodyBuildDto,
  ) {
    const bodyBuild = await this.bodyBuildService.create(
      createBodyBuildDto,
      req.user.id,
    );

    await this.bodyBuildService.createNeeds(createBodyBuildDto, bodyBuild.id);

    return bodyBuild;
  }

  @UseGuards(JwtAccessGuard)
  @Get()
  async findOne(@Request() req: RequestWithUserUniqueInput) {
    return this.bodyBuildService.findOne({
      userId: req.user.id,
    });
  }

  @UseGuards(JwtAccessGuard)
  @Patch()
  async update(
    @Request() req: RequestWithUserUniqueInput,
    @Body() updateBodyBuildDto: UpdateBodyBuildDto,
  ) {
    return this.bodyBuildService.update(
      { userId: req.user.id },
      updateBodyBuildDto,
    );
  }
}
