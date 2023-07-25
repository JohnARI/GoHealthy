import {
  Controller,
  Post,
  Body,
  ClassSerializerInterceptor,
  UseInterceptors,
  SerializeOptions,
  UseGuards,
  Get,
  Req,
  Patch,
  Delete,
} from '@nestjs/common';
import { SkipThrottle } from '@nestjs/throttler';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { ApiHeader, ApiResponse } from '@nestjs/swagger';
import { UsersSwaggerResponses } from 'src/swagger/users.swagger';
import { JwtAccessGuard } from 'src/auth/guards/jwt-access.guard';
import { RequestWithUserUniqueInput } from 'src/types/request.type';
import { PrismaService } from 'src/prisma/prisma.service';
import { UpdateUserDto } from './dto/update-user.dto';

@SkipThrottle()
@UseInterceptors(ClassSerializerInterceptor)
@SerializeOptions({ excludePrefixes: ['password', 'accountType', 'id'] })
@Controller('users')
export class UsersController {
  constructor(
    private readonly usersService: UsersService,
    private readonly prismaService: PrismaService,
  ) {}

  @Post()
  @ApiResponse(UsersSwaggerResponses.CREATE_SUCCESS)
  @ApiResponse(UsersSwaggerResponses.BAD_REQUEST)
  @ApiResponse(UsersSwaggerResponses.CREATE_CONFLICT)
  create(@Body() createUserDto: CreateUserDto) {
    return this.usersService.create(createUserDto);
  }

  @UseGuards(JwtAccessGuard)
  @Get('me')
  @ApiHeader(UsersSwaggerResponses.JWT_ACCESS_HEADER)
  @ApiResponse(UsersSwaggerResponses.PROFILE_SUCCESS)
  @ApiResponse(UsersSwaggerResponses.JWT_UNAUTHORIZED)
  @ApiResponse(UsersSwaggerResponses.NOT_FOUND)
  profile(@Req() req: RequestWithUserUniqueInput) {
    return this.usersService.findOne({ email: req.user.email });
  }

  @UseGuards(JwtAccessGuard)
  @Patch('me')
  @ApiHeader(UsersSwaggerResponses.JWT_ACCESS_HEADER)
  @ApiResponse(UsersSwaggerResponses.UPDATE_SUCCESS)
  @ApiResponse(UsersSwaggerResponses.JWT_UNAUTHORIZED)
  @ApiResponse(UsersSwaggerResponses.DATABASE_ERROR)
  update(@Req() req: RequestWithUserUniqueInput, @Body() body: UpdateUserDto) {
    return this.usersService.update({
      where: { email: req.user.email },
      data: body,
    });
  }

  @UseGuards(JwtAccessGuard)
  @Delete('me')
  @ApiHeader(UsersSwaggerResponses.JWT_ACCESS_HEADER)
  @ApiResponse(UsersSwaggerResponses.DELETE_SUCCESS)
  @ApiResponse(UsersSwaggerResponses.JWT_UNAUTHORIZED)
  @ApiResponse(UsersSwaggerResponses.NOT_FOUND)
  async delete(@Req() req: RequestWithUserUniqueInput) {
    await this.prismaService.connection.deleteMany({
      where: { user: { email: req.user.email } },
    });

    return this.usersService.delete({ email: req.user.email });
  }
}
