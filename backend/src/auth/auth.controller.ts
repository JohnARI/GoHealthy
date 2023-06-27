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
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { JwtAccessGuard } from './guards/jwt-access.guard';
import { LocalAuthGuard } from './guards/local-auth.guard';
import { AuthService } from './auth.service';
import { Prisma } from '@prisma/client';
import { UsersService } from 'src/users/users.service';
import { RefreshAuthGuard } from './guards/jwt-refresh.guard';
import { GoogleOauthGuard } from './guards/google-auth.guard';
import { RequestWithUserUniqueInput } from 'src/types/request.type';

@UseInterceptors(ClassSerializerInterceptor)
@SerializeOptions({ excludePrefixes: ['password', 'accountType'] })
@Controller('auth')
export class AuthController {
  constructor(
    private authService: AuthService,
    private usersService: UsersService,
  ) {}

  @UseGuards(LocalAuthGuard)
  @Post('login')
  @HttpCode(HttpStatus.OK)
  async login(@Request() req: Request & { user: Prisma.UserWhereUniqueInput }) {
    return this.authService.login(req.user);
  }

  @Get('google')
  @UseGuards(GoogleOauthGuard)
  googleAuth() {} // nothing to do here, the guard does it all!

  @Get('google/redirect')
  @UseGuards(GoogleOauthGuard)
  googleAuthRedirect(@Request() req) {
    return this.authService.googleLogin(req.user);
  }

  @UseGuards(JwtAccessGuard)
  @Get('logout')
  logout(@Request() req: RequestWithUserUniqueInput) {
    return this.authService.logout(req.user);
  }

  @UseGuards(RefreshAuthGuard)
  @Get('refresh')
  refreshToken(@Request() req: Request & { user: any }) {
    return this.authService.refreshToken(req.user.id, req.user.refreshToken);
  }
}
