import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/api_exceptions.dart';
import 'api_providers.dart';

/// A client that is used to make API requests.
///
/// The [APIClient] class provides methods to make various types of API requests,
/// such as GET, POST, PUT, DELETE, and PATCH. It handles sending the requests,
/// handling the responses, and parsing the data.
class APIClient {
  late final http.Client _client;

  /// Creates a new instance of [APIClient].
  ///
  /// This constructor initializes the [http.Client] used for making API requests.
  APIClient() {
    _client = http.Client();
  }

  /// Sends a generic API request with the specified [endpoint] and [method].
  ///
  /// This method sends an API request with the provided [endpoint] and [method].
  /// It also allows including headers and an optional request [body].
  /// The response is processed, and the decoded body is returned as a dynamic object.
  /// If the response status code indicates an error, the appropriate exception is thrown.
  Future<dynamic> _request(String endpoint, String method,
      {Map<String, dynamic>? body, bool includeHeaders = true}) async {
    final Uri uri = Uri.parse('${APIProvider.baseUrl}$endpoint');
    final http.Request request = http.Request(method, uri);

    if (includeHeaders) {
      request.headers.addAll(APIProvider.headers);
    }

    if (body != null) {
      request.body = jsonEncode(body);
    }

    try {
      final http.StreamedResponse response = await _client
          .send(request)
          .timeout(const Duration(seconds: APIProvider.timeoutDuration));

      final String responseBody = await response.stream.bytesToString();
      final dynamic decodedBody = jsonDecode(responseBody);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return decodedBody;
      }
      if (response.statusCode == 401) {
        throw UnauthorizedException('Unauthorized request');
      }
      if (response.statusCode == 403) {
        throw ForbiddenException('Forbidden request');
      }
      if (response.statusCode == 404) {
        throw NotFoundException('Resource not found');
      }
      if (response.statusCode >= 500) {
        throw ServerErrorException('Server error occurred');
      }
      if (response.statusCode >= 400 && response.statusCode < 500) {
        throw BadRequestException('Bad request');
      }
      throw UnknownException('Unknown error occurred');
    } catch (e) {
      if (e is TimeOutException) {
        throw TimeOutException('Connection timed out');
      } else {
        throw NoInternetException('No internet connection');
      }
    }
  }

  /// Sends a GET request to the specified [endpoint].
  ///
  /// This method sends a GET request to the provided [endpoint] and returns the
  /// decoded response body as a dynamic object. The [includeHeaders] parameter
  /// determines whether to include the default headers in the request.
  Future<dynamic> getRequest(String endpoint,
      {bool includeHeaders = true}) async {
    return _request(endpoint, 'GET', includeHeaders: includeHeaders);
  }

  /// Sends a POST request to the specified [endpoint] with the given [body].
  ///
  /// This method sends a POST request to the provided [endpoint] with the [body]
  /// and returns the decoded response body as a dynamic object. The [includeHeaders]
  /// parameter determines whether to include the default headers in the request.
  Future<dynamic> postRequest(String endpoint, Map<String, dynamic> body,
      {bool includeHeaders = true}) async {
    return _request(endpoint, 'POST',
        body: body, includeHeaders: includeHeaders);
  }

  /// Sends a PUT request to the specified [endpoint] with the given [body].
  ///
  /// This method sends a PUT request to the provided [endpoint] with the [body]
  /// and returns the decoded response body as a dynamic object. The [includeHeaders]
  /// parameter determines whether to include the default headers in the request.
  Future<dynamic> putRequest(String endpoint, Map<String, dynamic> body,
      {bool includeHeaders = true}) async {
    return _request(endpoint, 'PUT',
        body: body, includeHeaders: includeHeaders);
  }

  /// Sends a DELETE request to the specified [endpoint].
  ///
  /// This method sends a DELETE request to the provided [endpoint] and returns the
  /// decoded response body as a dynamic object. The [includeHeaders] parameter
  /// determines whether to include the default headers in the request.
  Future<dynamic> deleteRequest(String endpoint,
      {bool includeHeaders = true}) async {
    return _request(endpoint, 'DELETE', includeHeaders: includeHeaders);
  }

  /// Sends a PATCH request to the specified [endpoint] with the given [body].
  ///
  /// This method sends a PATCH request to the provided [endpoint] with the [body]
  /// and returns the decoded response body as a dynamic object. The [includeHeaders]
  /// parameter determines whether to include the default headers in the request.
  Future<dynamic> patchRequest(String endpoint, Map<String, dynamic> body,
      {bool includeHeaders = true}) async {
    return _request(endpoint, 'PATCH',
        body: body, includeHeaders: includeHeaders);
  }

  /// Closes the underlying [http.Client] instance.
  ///
  /// This method closes the underlying [http.Client] instance, releasing any
  /// resources associated with it.
  void dispose() {
    _client.close();
  }
}
