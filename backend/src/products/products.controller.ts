import {
  Controller,
  Post,
  Body,
  Get,
  Patch,
  Delete,
  Param,
  ParseUUIDPipe,
  UseGuards,
  HttpCode,
} from '@nestjs/common';

import { ProductsService } from './products.service';
import { JwtAccessGuard } from '../auth/guards/jwt-access.guard';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';

@Controller('products')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  @UseGuards(JwtAccessGuard)
  @Post()
  async create(@Body() data: CreateProductDto) {
    return this.productsService.create(data);
  }

  @Get(':id')
  async getProductById(@Param('id', ParseUUIDPipe) id: string) {
    return this.productsService.findOne({ id });
  }

  @UseGuards(JwtAccessGuard)
  @Patch(':id')
  async updateProduct(
    @Param('id', ParseUUIDPipe) id: string,
    @Body()
    data: UpdateProductDto,
  ) {
    return this.productsService.update({
      where: { id },
      data,
    });
  }

  @UseGuards(JwtAccessGuard)
  @Delete(':id')
  @HttpCode(204)
  async deleteProduct(@Param('id', ParseUUIDPipe) id: string) {
    return this.productsService.deleteProduct({ id });
  }
}
