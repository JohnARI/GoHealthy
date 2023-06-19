/// Provides the API endpoints used in the application.
///
/// The [APIEndpoint] class contains static properties that represent the various
/// API endpoints used in the application.
class APIEndpoint {
  static String example() => '/example';
  static String exampleWithId(int id) => '/example/$id';

  static String posts() => '/posts';
}
