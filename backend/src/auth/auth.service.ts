import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { AccountType, Prisma, User } from '@prisma/client';
import * as nodemailer from 'nodemailer';
import * as bcrypt from 'bcrypt';
import { env } from 'process';
import { PrismaService } from 'src/prisma/prisma.service';
import { UsersService } from '../users/users.service';

@Injectable()
export class AuthService {
  private transporter: nodemailer.Transporter;

  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
    private prismaService: PrismaService,
  ) {
    this.transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: env.MAIL_SMTP,
        pass: env.MAIL_PASSWORD,
      },
      port: 587,
      host: 'smtp.gmail.com',
    });
  }

  async validateUser(email: string, pass: string): Promise<any> {
    const user = await this.usersService.findOne({ email });

    if (!user || user.accountType !== AccountType.DEFAULT) {
      throw new HttpException('Unauthorized', HttpStatus.UNAUTHORIZED);
    }

    const isPassCorrect = await bcrypt.compare(pass, user.password);

    if (isPassCorrect) {
      return user;
    }

    throw new HttpException('Unauthorized', HttpStatus.UNAUTHORIZED);
  }

  async login(user: Prisma.UserWhereUniqueInput) {
    const payload = { email: user.email, id: user.id };
    const tokens = await this.generateTokens(payload);

    await this.createConnection(user.id, tokens.refresh_token);

    return tokens;
  }

  async logout(user: Prisma.UserWhereUniqueInput) {
    await this.prismaService.connection.deleteMany({
      where: { userId: user.id },
    });
  }

  async generateTokens(payload: { email: string; id: string }) {
    const access_token = this.jwtService.sign(payload);
    const refresh_token = this.jwtService.sign(payload, {
      secret: process.env.JWT_REFRESH_SECRET,
      expiresIn: '30d',
    });

    return { access_token, refresh_token };
  }

  async createConnection(id: string, refreshToken: string) {
    const hash = await bcrypt.hash(refreshToken, 10);

    await this.prismaService.connection.create({
      data: { userId: id, refreshToken: hash },
    });
  }

  async refreshToken(userId: string, refreshToken: string) {
    const user = await this.usersService.findOne(
      { id: userId },
      { connections: true },
    );

    if (!user || user.connections.length === 0) {
      throw new HttpException('Unauthorized', HttpStatus.UNAUTHORIZED);
    }

    const connection = user.connections.find(
      async (connection) =>
        await bcrypt.compare(refreshToken, connection.refreshToken),
    );

    if (!connection) {
      throw new HttpException('Unauthorized', HttpStatus.UNAUTHORIZED);
    }

    const payload = { email: user.email, id: user.id };

    return { access_token: this.jwtService.sign(payload) };
  }

  //MAIL STUFF
  async generateResetPasswordCode(userId: string): Promise<number> {
    // Vérifiez si l'utilisateur a déjà un code de réinitialisation du mot de passe existant
    const user = await this.prismaService.user.findUnique({
      where: { id: userId },
      include: { codeResetPassword: true },
    });

    if (user.codeResetPassword) {
      // Supprimez l'ancien code de réinitialisation du mot de passe
      await this.prismaService.codeResetPassword.delete({
        where: { id: user.codeResetPassword.id },
      });
    }

    // Générez un nouveau code
    const code = Math.floor(100000 + Math.random() * 900000);

    //Calculez la date d'expiration du code + 15 minutes
    const expirationDate = new Date();
    expirationDate.setMinutes(expirationDate.getMinutes() + 15);

    // Associez le nouveau code à l'utilisateur
    await this.prismaService.codeResetPassword.create({
      data: {
        code,
        expirationDate,
        user: { connect: { id: userId } },
      },
    });

    return code;
  }

  async sendPasswordResetEmail(userEmail: string): Promise<void> {
    // Logique pour envoyer l'e-mail de réinitialisation de mot de passe

    const user = await this.usersService.findOne({ email: userEmail });
    const code = await this.generateResetPasswordCode(user.id);
    const mailOptions: nodemailer.SendMailOptions = {
      from: env.MAIL_SMTP,
      to: userEmail,
      subject: 'Réinitialisation de mot de passe',
      text: `Voici le code pour réinitaliser le mot de passe:  ${code}`,
    };

    await this.transporter.sendMail(mailOptions);
  }

  async checkIfTokenIsValid(code: number, email: string): Promise<boolean> {
    const codeResetPassword =
      await this.prismaService.codeResetPassword.findUnique({
        where: { code },
        include: { user: true },
      });
    const user = await this.usersService.findOne({
      email: email,
    });

    if (
      codeResetPassword?.expirationDate > new Date() &&
      codeResetPassword.userId === user.id
    ) {
      return true;
    }
    return false;
  }

  async resetPassword(
    code: number,
    newPassword: string,
    email: string,
  ): Promise<User> {
    if (await this.checkIfTokenIsValid(code, email)) {
      const user = await this.usersService.findOne({ email });
      const password = await bcrypt.hash(newPassword, 10);
      await this.prismaService.user.update({
        where: { id: user.id },
        data: { password },
      });
      return user;
    }
    throw new HttpException('Unauthorized', HttpStatus.UNAUTHORIZED);
  }

  // async sendVerificationEmail(
  //   to: string,
  //   verificationToken: string,
  // ): Promise<void> {
  //   // Logique pour envoyer l'e-mail de vérification de compte
  //   const mailOptions: nodemailer.SendMailOptions = {
  //     from: env.MAIL_SMTP,
  //     to,
  //     subject: 'Vérification de compte',
  //     text: `Cliquez sur le lien suivant pour vérifier votre compte : ${verificationToken}`,
  //   };

  //   await this.transporter.sendMail(mailOptions);
  // }
}
