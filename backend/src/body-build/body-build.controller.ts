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
  Req,
} from '@nestjs/common';
import { BodyBuildService } from './body-build.service';
import { CreateBodyBuildDto } from './dto/create-body-build.dto';
import { UpdateBodyBuildDto } from './dto/update-body-build.dto';
import { JwtAccessGuard } from 'src/auth/guards/jwt-access.guard';
import { RequestWithUserUniqueInput } from 'src/types/request.type';

@Controller('body-build')
export class BodyBuildController {
  constructor(private readonly bodyBuildService: BodyBuildService) {}

  @UseGuards(JwtAccessGuard)
  @Post()
  async create(@Body() createBodyBuildDto: CreateBodyBuildDto) {
    const bodyBuild = await this.bodyBuildService.create(createBodyBuildDto);
    await this.bodyBuildService.createNeeds(createBodyBuildDto, bodyBuild.id);
    return bodyBuild;
  }

  @UseGuards(JwtAccessGuard)
  @Get()
  async findAll() {
    return this.bodyBuildService.findAll();
  }

  @UseGuards(JwtAccessGuard)
  @Get(':id')
  async findOne(@Param('id', ParseUUIDPipe) id: string) {
    return this.bodyBuildService.findOne(id);
  }

  @UseGuards(JwtAccessGuard)
  @Patch(':id')
  async update(
    @Param('id', ParseUUIDPipe) id: string,
    @Body() updateBodyBuildDto: UpdateBodyBuildDto,
  ) {
    const updatedBodyBuild = await this.bodyBuildService.update(
      id,
      updateBodyBuildDto,
    );
    return updatedBodyBuild;
  }

  @UseGuards(JwtAccessGuard)
  @Delete(':id')
  @HttpCode(204)
  async remove(@Param('id', ParseUUIDPipe) id: string) {
    return this.bodyBuildService.remove(id);
  }

  @UseGuards(JwtAccessGuard)
  @Get('wheightevolution')
  async getWheightEvolution(@Req() req: RequestWithUserUniqueInput) {
    return this.bodyBuildService.getWheightEvolution(req.user.id);
  }
}
