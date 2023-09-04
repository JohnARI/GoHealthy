import 'api_providers.dart';

/// Provides the API endpoints used in the application.
///
/// The [ApiEndpoint] class contains static methods that generate the various
/// API endpoints used in the application. The base URL is obtained from the
/// [ApiProvider] class.
class ApiEndpoint {
  static final String _baseUrl = ApiProvider.baseUrl;

  static String example() => '$_baseUrl/example';
  static String exampleWithId(int id) => '$_baseUrl/example/$id';

  static String login() => '$_baseUrl/auth/login';
  static String register() => '$_baseUrl/auth/users';
  static String logout() => '$_baseUrl/auth/logout';
  static String loginGoogle() => '$_baseUrl/auth/google';

  static String getMe() => '$_baseUrl/users/me';

  static String getProductWithId(String id) => '$_baseUrl/products/$id';
  static String createProduct() => '$_baseUrl/products';
}
