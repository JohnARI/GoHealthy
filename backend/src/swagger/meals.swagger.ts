import { CreateMealDto } from 'src/meals/dto/create-meal.dto';
import { CreateUserDto } from 'src/users/dto/create-user.dto';

export class MealSwaggerResponses {
  static readonly GET_MEALS = {
    status: 200,
    description: 'Returns all meals',
    type: CreateMealDto,
  };
  static readonly CREATE_SUCCESS = {
    status: 201,
    description: 'The meal has been successfully created',
    type: CreateMealDto,
  };
}
