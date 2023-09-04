import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

/// This class is a singleton that provides the API Client and headers.
///
/// The [APIProvider] class is responsible for creating the HTTP client and defining the headers
/// required for making API requests. It retrieves the base URL from the environment variables
/// using the [dotenv] package.
class APIProvider {
  APIProvider._();

  static final APIProvider _instance = APIProvider._();

  factory APIProvider() => _instance;

  static final String baseUrl = dotenv.env['API_BASE_URL']!;
  static const int timeoutDuration = 10;

  static final Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ', // TODO: add bearer token here
  };

  http.Client getClient() {
    final http.Client client = http.Client();
    return client;
  }
}
