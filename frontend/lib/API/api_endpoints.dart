import 'api_providers.dart';

class APIEndpoint {
  static final String _baseUrl = APIProvider.baseUrl;

  static String example() => '$_baseUrl/example';
  static String exampleWithId(int id) => '$_baseUrl/example/$id';

  static String login() => '$_baseUrl/auth/login';
  static String googleOauth() => '$_baseUrl/auth/goole';
  static String users() => '$_baseUrl/auth/users';
  static String logout() => '$_baseUrl/auth/logout';
}
