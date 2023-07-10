import 'api_providers.dart';

/// Provides the API endpoints used in the application.
///
/// The [APIEndpoint] class contains static methods that generate the various
/// API endpoints used in the application. The base URL is obtained from the
/// [APIProvider] class.
class APIEndpoint {
  static final String _baseUrl = APIProvider.baseUrl;

  static String example() => '$_baseUrl/example';
  static String exampleWithId(int id) => '$_baseUrl/example/$id';

  static String login() => '$_baseUrl/auth/login';
  static String register() => '$_baseUrl/auth/users';
  static String logout() => '$_baseUrl/auth/logout';

  static String getMe() => '$_baseUrl/users/me';
}
