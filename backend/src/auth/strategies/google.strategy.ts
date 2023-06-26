import { PassportStrategy } from '@nestjs/passport';
import { Strategy } from 'passport-google-oauth20';
import { Injectable } from '@nestjs/common';

@Injectable()
export class GoogleStrategy extends PassportStrategy(Strategy, 'google') {
  constructor() {
    super({
      clientID: process.env.OAUTH_GOOGLE_CLIENT_ID,
      clientSecret: process.env.OAUTH_GOOGLE_SECRET,
      callbackURL: 'http://localhost:5000/auth/google/redirect',
      scope: ['email', 'profile'],
    });
  }

  async validate(
    // not using the google access and refresh tokens for now
    // we just need the profile info
    accessToken: string,
    refreshToken: string,
    profile: any,
  ): Promise<any> {
    return {
      email: profile.emails[0].value,
      username: profile.name.givenName,
    };
  }
}
