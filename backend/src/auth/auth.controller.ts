import {
  Body,
  ClassSerializerInterceptor,
  Controller,
  Get,
  HttpCode,
  HttpException,
  HttpStatus,
  Post,
  Request,
  SerializeOptions,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import { ApiHeader, ApiResponse } from '@nestjs/swagger';
import { AccountType, Prisma } from '@prisma/client';
import { OAuth2Client } from 'google-auth-library';
import { AuthSwaggerResponses } from 'src/swagger/auth.swagger';
import { RequestWithUserUniqueInput } from 'src/types/request.type';
import { UsersService } from 'src/users/users.service';
import { AuthService } from './auth.service';
import { JwtAccessGuard } from './guards/jwt-access.guard';
import { RefreshAuthGuard } from './guards/jwt-refresh.guard';
import { LocalAuthGuard } from './guards/local-auth.guard';

const client = new OAuth2Client(
  process.env.GOOGLE_CLIENT_ID,
  process.env.GOOGLE_CLIENT_SECRET,
);

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

  @Post('google')
  @ApiResponse(AuthSwaggerResponses.TO_BE_DONE)
  async googleAuth(@Body('id_token') idToken: string) {
    const ticket = await client.verifyIdToken({
      idToken: idToken,
      audience: process.env.OAUTH_GOOGLE_CLIENT_ID,
    });

    const payload = ticket.getPayload();
    const dbUser = await this.usersService.findOne({ email: payload.email });

    if (dbUser && dbUser.accountType !== AccountType.GOOGLE)
      return new HttpException(
        'This email is already registered with another account',
        HttpStatus.CONFLICT,
      );

    const finalUser =
      dbUser ||
      (await this.usersService.create({
        email: payload.email,
        username: payload.name,
        accountType: AccountType.GOOGLE,
        password: '',
      }));

    return this.authService.login({
      email: finalUser.email,
      id: finalUser.id,
    });
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

  @Post('sendresetpassword')
  async sendResetPassword(@Body() body: { email: string }) {
    return this.authService.sendPasswordResetEmail(body.email);
  }

  @Post('checkcodevalidity')
  @HttpCode(HttpStatus.OK)
  async checkCodeValidity(@Body() body: { code: number; email: string }) {
    return this.authService.checkIfTokenIsValid(Number(body.code), body.email);
  }

  @Post('resetpassword')
  @HttpCode(HttpStatus.OK)
  async resetPassword(
    @Body() body: { code: number; password: string; email: string },
  ) {
    return this.authService.resetPassword(
      Number(body.code),
      body.password,
      body.email,
    );
  }
}
