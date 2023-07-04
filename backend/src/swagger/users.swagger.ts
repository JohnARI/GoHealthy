import { CreateUserDto } from 'src/users/dto/create-user.dto';

export class UsersSwaggerResponses {
  static readonly JWT_ACCESS_HEADER = {
    name: 'Authorization',
    description: 'The JWT access token used to authenticate the request',
  };

  static readonly JWT_UNAUTHORIZED = {
    status: 401,
    description: 'The JWT access token is invalid',
  };

  static readonly NOT_FOUND = {
    status: 404,
    description:
      'The ressource(s) with the given parameter(s) was(where) not found',
  };

  static readonly DATABASE_ERROR = {
    status: 409,
    description: 'An error occured in the database',
  };

  static readonly CREATE_SUCCESS = {
    status: 201,
    description:
      "The user has been successfully created. Also returns the user's information, except the password",
    type: CreateUserDto,
  };

  static readonly CREATE_CONFLICT = {
    status: 409,
    description:
      'This error indicates the email provided is already used by another user',
  };

  static readonly PROFILE_SUCCESS = {
    status: 200,
    description: "Returns the user's profile information",
    schema: {
      properties: {
        email: {
          type: 'string',
          description: "The user's email",
        },
        username: {
          type: 'string',
          description: "The user's username",
        },
      },
    },
  };

  static readonly UPDATE_SUCCESS = {
    status: 200,
    description: "Returns the user's updated profile information",
    schema: {
      properties: {
        email: {
          type: 'string',
          description: "The user's email",
        },
        username: {
          type: 'string',
          description: "The user's username",
        },
      },
    },
  };

  static readonly DELETE_SUCCESS = {
    status: 204,
    description: 'User successfully deleted, no content returned',
  };
}
