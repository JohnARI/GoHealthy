import {
  Controller,
  Get,
  Request,
  Post,
  UseGuards,
  Patch,
  Body,
  SerializeOptions,
  UseInterceptors,
  ClassSerializerInterceptor,
} from '@nestjs/common';
import { JwtAccessGuard } from './guards/jwt-access.guard';
import { LocalAuthGuard } from './guards/local-auth.guard';
import { AuthService } from './auth.service';
import { Prisma } from '@prisma/client';
import { UsersService } from 'src/users/users.service';
import { RefreshAuthGuard } from './guards/jwt-refresh.guard';

@UseInterceptors(ClassSerializerInterceptor)
@SerializeOptions({ excludePrefixes: ['password'] })
@Controller()
export class AuthController {
  constructor(
    private authService: AuthService,
    private usersService: UsersService,
  ) {}

  @UseGuards(LocalAuthGuard)
  @Post('login')
  async login(@Request() req: Request & { user: Prisma.UserWhereUniqueInput }) {
    return this.authService.login(req.user);
  }

  @UseGuards(JwtAccessGuard)
  @Get('profile')
  getProfile(@Request() req: Request & { user: Prisma.UserWhereUniqueInput }) {
    return this.usersService.findOne({ id: req.user.id });
  }

  @UseGuards(JwtAccessGuard)
  @Patch('profile')
  updateProfile(
    @Body() body: Prisma.UserUpdateInput,
    @Request() req: Request & { user: Prisma.UserWhereUniqueInput },
  ) {
    return this.usersService.update({
      where: { id: req.user.id },
      data: body,
    });
  }

  @UseGuards(JwtAccessGuard)
  @Get('logout')
  logout(@Request() req: Request & { user: Prisma.UserWhereUniqueInput }) {
    return this.authService.logout(req.user);
  }

  @UseGuards(RefreshAuthGuard)
  @Get('refresh')
  refreshToken(@Request() req: Request & { user: any }) {
    return this.authService.refreshToken(req.user.id, req.user.refreshToken);
  }
}
