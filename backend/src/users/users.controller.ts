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
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { JwtAccessGuard } from 'src/auth/guards/jwt-access.guard';
import { RequestWithUserUniqueInput } from 'src/types/request.type';
import { PrismaService } from 'src/prisma/prisma.service';
import { UpdateUserDto } from './dto/update-user.dto';

@UseInterceptors(ClassSerializerInterceptor)
@SerializeOptions({ excludePrefixes: ['password', 'accountType', 'id'] })
@Controller('users')
export class UsersController {
  constructor(
    private readonly usersService: UsersService,
    private readonly prismaService: PrismaService,
  ) {}

  @Post()
  create(@Body() createUserDto: CreateUserDto) {
    return this.usersService.create(createUserDto);
  }

  @UseGuards(JwtAccessGuard)
  @Get('me')
  profile(@Req() req: RequestWithUserUniqueInput) {
    return this.usersService.findOne({ email: req.user.email });
  }

  @UseGuards(JwtAccessGuard)
  @Patch('me')
  update(@Req() req: RequestWithUserUniqueInput, @Body() body: UpdateUserDto) {
    return this.usersService.update({
      where: { email: req.user.email },
      data: body,
    });
  }

  @UseGuards(JwtAccessGuard)
  @Delete('me')
  async delete(@Req() req: RequestWithUserUniqueInput) {
    await this.prismaService.connection.deleteMany({
      where: { user: { email: req.user.email } },
    });

    return this.usersService.delete({ email: req.user.email });
  }
}
