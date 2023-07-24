import 'dart:developer';

import 'package:http/http.dart' as http;

import '../helpers/api_helper.dart';
import 'api_providers.dart';
// TODO: UPDATE THIS FILE WHEN THE API IS READY

/// A client that is used to make API requests.
///
/// The [APIClient] class provides methods to make various types of API requests,
/// such as GET, POST, PUT, DELETE, and PATCH. It handles sending the requests,
/// handling the responses, and parsing the data.
class APIClient {
  static late final http.Client _client;

  /// Creates a new instance of [APIClient].
  ///
  /// This constructor initializes the [http.Client] used for making API requests.
  APIClient() {
    _client = APIProvider.getClient();
  }

  /// Sends a GET request to the specified [endpoint].
  ///
  /// This method sends a GET request to the provided [endpoint] and returns the
  /// response body of type [T]. The [headers] and [includeHeaders] parameters
  /// can be used to specify additional headers for the request and control whether
  /// the default headers should be included.
  static Future<T> getHttpRequest<T>(
    String endpoint, {
    Map<String, String>? headers,
    bool includeHeaders = true,
  }) async {
    try {
      // If includeHeaders is not set to false, then the headers will be included in the request headers.
      final Map<String, String>? requestHeaders =
          includeHeaders ? headers ?? APIProvider.headers : null;
      final http.Response response = await _client.get(
        Uri.parse(endpoint),
        headers: requestHeaders,
      );
      final dynamic result = handleResponse(response);
      return result as T;
    } catch (e) {
      // TODO : Handle exception with API response
      handleException(e);
      rethrow;
    }
  }

  /// Sends a POST request to the specified [endpoint] with the given [body].
  ///
  /// This method sends a POST request to the provided [endpoint] with the [body]
  /// and returns the response body of type [T]. The [headers] and [includeHeaders]
  /// parameters can be used to specify additional headers for the request and control
  /// whether the default headers should be included.
  static Future<T> postHttpRequest<T>(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
    bool includeHeaders = true,
  }) async {
    try {
      // If includeHeaders is not set to false, then the headers will be included in the request headers.
      final Map<String, String>? requestHeaders =
          includeHeaders ? headers ?? APIProvider.headers : null;
      log(
        name: 'APIClient',
        'Request body: $body, Request headers: $requestHeaders, Request endpoint: $endpoint',
      );
      print('========');
      final http.Response response = await _client.post(
        Uri.parse(endpoint),
        headers: requestHeaders,
        body: body,
      );
      final dynamic result = handleResponse(response);
      print('========');
      log(
        name: 'APIClient',
        'Converting response completed...',
      );
      return result as T;
    } catch (e) {
      print(e);
      log(
        name: 'APIClient',
        e.toString(),
        error: e,
      );
      // TODO : Handle exception with API response
      handleException(e);
      rethrow;
    }
  }

  /// Closes the underlying [http.Client] instance.
  ///
  /// This method closes the underlying [http.Client] instance, releasing any
  /// resources associated with it.
  void dispose() {
    _client.close();
  }
}
