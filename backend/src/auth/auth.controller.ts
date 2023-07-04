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
import { ApiHeader, ApiResponse } from '@nestjs/swagger';
import { AuthSwaggerResponses } from 'src/swagger/auth.swagger';

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
  @ApiResponse(AuthSwaggerResponses.LOGIN_SUCCESS)
  @ApiResponse(AuthSwaggerResponses.LOGIN_UNAUTHORIZED)
  async login(@Request() req: Request & { user: Prisma.UserWhereUniqueInput }) {
    return this.authService.login(req.user);
  }

  @Get('google')
  @ApiResponse(AuthSwaggerResponses.TO_BE_DONE)
  @UseGuards(GoogleOauthGuard)
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  googleAuth() {} // nothing to do here, the guard does it all!

  @Get('google/redirect')
  @UseGuards(GoogleOauthGuard)
  @ApiResponse(AuthSwaggerResponses.TO_BE_DONE)
  googleAuthRedirect(@Request() req) {
    return this.authService.googleLogin(req.user);
  }

  @UseGuards(JwtAccessGuard)
  @Get('logout')
  @ApiHeader(AuthSwaggerResponses.JWT_ACCESS_HEADER)
  @ApiResponse(AuthSwaggerResponses.LOGOUT_SUCCESS)
  @ApiResponse(AuthSwaggerResponses.JWT_UNAUTHORIZED)
  logout(@Request() req: RequestWithUserUniqueInput) {
    return this.authService.logout(req.user);
  }

  @UseGuards(RefreshAuthGuard)
  @Get('refresh')
  @ApiHeader(AuthSwaggerResponses.JWT_REFRESH_HEADER)
  @ApiResponse(AuthSwaggerResponses.REFRESH_SUCCESS)
  @ApiResponse(AuthSwaggerResponses.JWT_UNAUTHORIZED)
  refreshToken(@Request() req: Request & { user: any }) {
    return this.authService.refreshToken(req.user.id, req.user.refreshToken);
  }
}
