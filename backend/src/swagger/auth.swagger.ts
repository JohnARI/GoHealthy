import { AccountType } from '@prisma/client';

export class AuthSwaggerResponses {
  static readonly TO_BE_DONE = {
    status: 200,
    description: 'To be done (needs discussion based on what the route does)',
  };

  static readonly JWT_ACCESS_HEADER = {
    name: 'Authorization',
    description: 'The JWT access token used to authenticate the request',
  };

  static readonly JWT_REFRESH_HEADER = {
    name: 'Authorization',
    description: 'The JWT refresh token used to authenticate the request',
  };

  static readonly LOGIN_SUCCESS = {
    status: 200,
    description:
      'The user has been successfully logged in. Returns a JWT access token and a refresh token',
    schema: {
      properties: {
        access_token: {
          type: 'string',
          description: 'The JWT access token',
        },
        refresh_token: {
          type: 'string',
          description: 'The JWT refresh token',
        },
      },
    },
  };

  static readonly LOGOUT_SUCCESS = {
    status: 200,
    description:
      'Means that the user is sucessfully logged out in the back end side. The front end side logout needs to be triggered by this response',
  };

  static readonly REFRESH_SUCCESS = {
    status: 200,
    description: 'Returns a new JWT access token',
    schema: {
      properties: {
        access_token: {
          type: 'string',
          description: 'The JWT access token',
        },
      },
    },
  };

  static readonly LOGIN_UNAUTHORIZED = {
    status: 401,
    description:
      'This error indicates that the login process failed because either the email or the password provided are incorrect',
  };

  static readonly JWT_UNAUTHORIZED = {
    status: 401,
    description:
      'This error indicates that the jwt Token is invalid. Receiving this response needs to trigger a call to the "refresh" route and then try the request again',
  };

  static readonly REFRESH_UNAUTHORIZED = {
    status: 401,
    description:
      'This error indicates that the refresh token provided is invalid. The front end needs to redirect the user to the login page and erase all local storage data, as the user is no longuer logged in this session',
  };
}
