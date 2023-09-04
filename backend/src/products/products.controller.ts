import {
  Controller,
  Post,
  Body,
  Patch,
  Delete,
  Param,
  ParseUUIDPipe,
  UseGuards,
  HttpCode,
} from '@nestjs/common';
import { SkipThrottle } from '@nestjs/throttler';

import { ProductsService } from './products.service';
import { JwtAccessGuard } from '../auth/guards/jwt-access.guard';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';

@SkipThrottle()
@Controller('products')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  // @UseGuards(JwtAccessGuard)
  // @Post()
  // async create(@Body() data: CreateProductDto) {
  //   return this.productsService.create(data);
  // }

  @UseGuards(JwtAccessGuard)
  @Patch(':id')
  async update(
    @Param('id', ParseUUIDPipe) id: string,
    @Body() data: UpdateProductDto,
  ) {
    return this.productsService.update(id, data);
  }

  @UseGuards(JwtAccessGuard)
  @Delete(':id')
  @HttpCode(204)
  async deleteProduct(@Param('id', ParseUUIDPipe) id: string) {
    return this.productsService.delete({ id });
  }
}
