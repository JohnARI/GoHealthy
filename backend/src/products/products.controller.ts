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
import { ProductsService } from './products.service';
import { Prisma } from '@prisma/client';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';

@Controller('products')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  @UseGuards(JwtAuthGuard)
  @Post()
  async create(@Body() data: Prisma.ProductsCreateInput) {
    try {
      await this.productsService.create(data);
    } catch (error) {
      throw new BadRequestException(error.message);
    }
  }

  @Get(':id')
  async getProductById(@Param('id', ParseUUIDPipe) id: string) {
    try {
      await this.productsService.findOne({ id });
    } catch (error) {
      throw new NotFoundException(error);
    }
  }

  @UseGuards(JwtAuthGuard)
  @Patch(':id')
  async updateProduct(
    @Param('id', ParseUUIDPipe) id: string,
    @Body()
    data: Prisma.ProductsUpdateInput,
  ) {
    try {
      await this.productsService.update({
        where: { id },
        data,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }

  @UseGuards(JwtAuthGuard)
  @Delete(':id')
  async deleteProduct(@Param('id', ParseUUIDPipe) id: string) {
    try {
      await this.productsService.deleteProduct({ id });
    } catch (error) {
      throw new NotFoundException(error);
    }
  }
}
