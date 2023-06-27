import {
  Controller,
  Post,
  Body,
  Get,
  Patch,
  Delete,
  Param,
  NotFoundException,
  BadRequestException,
  ParseUUIDPipe,
  UseGuards,
} from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { SkipThrottle } from '@nestjs/throttler';
import { ProductsService } from './products.service';
import { JwtAccessGuard } from '../auth/guards/jwt-access.guard';

@SkipThrottle()
@Controller('products')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  @UseGuards(JwtAccessGuard)
  @Post()
  async create(@Body() data: Prisma.ProductsCreateInput) {
    try {
      return this.productsService.create(data);
    } catch (error) {
      throw new BadRequestException(error.message);
    }
  }

  @Get(':id')
  async getProductById(@Param('id', ParseUUIDPipe) id: string) {
    try {
      return this.productsService.findOne({ id });
    } catch (error) {
      throw new NotFoundException(error);
    }
  }

  @UseGuards(JwtAccessGuard)
  @Patch(':id')
  async updateProduct(
    @Param('id', ParseUUIDPipe) id: string,
    @Body()
    data: Prisma.ProductsUpdateInput,
  ) {
    try {
      return this.productsService.update({
        where: { id },
        data,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }

  @UseGuards(JwtAccessGuard)
  @Delete(':id')
  async deleteProduct(@Param('id', ParseUUIDPipe) id: string) {
    try {
      return this.productsService.deleteProduct({ id });
    } catch (error) {
      throw new NotFoundException(error);
    }
  }
}
