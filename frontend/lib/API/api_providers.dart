import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_healthy/utils/shared_preference.dart';
import 'package:http/http.dart' as http;

/// This class is a singleton that provides the API Client and headers.
///
/// The [ApiProvider] class is responsible for creating the HTTP client and defining the headers
/// required for making API requests. It retrieves the base URL from the environment variables
/// using the [dotenv] package.
class ApiProvider {
  ApiProvider._();

  static final ApiProvider _instance = ApiProvider._();

  factory ApiProvider() => _instance;

  static final String baseUrl = dotenv.env['API_BASE_URL']!;
  static const int timeoutDuration = 10;
  static final String? accessToken = SharedPreference.getAccessToken();

  static final Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };

  static http.Client getClient() {
    log(name: 'APIProvider', 'Creating HTTP client...');
    final http.Client client = http.Client();
    return client;
  }
}
