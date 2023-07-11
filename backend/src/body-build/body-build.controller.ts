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
} from '@nestjs/common';
import { BodyBuildService } from './body-build.service';
import { CreateBodyBuildDto } from './dto/create-body-build.dto';
import { UpdateBodyBuildDto } from './dto/update-body-build.dto';
import { JwtAccessGuard } from 'src/auth/guards/jwt-access.guard';

@Controller('body-build')
export class BodyBuildController {
  constructor(private readonly bodyBuildService: BodyBuildService) {}

  @UseGuards(JwtAccessGuard)
  @Post()
  async create(@Body() createBodyBuildDto: CreateBodyBuildDto) {
    return this.bodyBuildService.create(createBodyBuildDto);
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
    return this.bodyBuildService.update(id, updateBodyBuildDto);
  }

  @UseGuards(JwtAccessGuard)
  @Delete(':id')
  @HttpCode(204)
  async remove(@Param('id', ParseUUIDPipe) id: string) {
    return this.bodyBuildService.remove(id);
  }
}
