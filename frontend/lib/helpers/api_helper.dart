import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../utils/api_exceptions.dart';

T handleResponse<T>(http.Response response) {
  log(
    name: 'APIHelper',
    'Converting response...',
  );

  final dynamic result = jsonDecode(response.body);

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return result as T;
  } else if (response.statusCode == 400) {
    throw BadRequestException(result['message']);
  } else if (response.statusCode == 401) {
    throw UnauthorizedException(result['message']);
  } else if (response.statusCode == 403) {
    throw ForbiddenException(result['message']);
  } else if (response.statusCode == 404) {
    throw NotFoundException(result['message']);
  } else if (response.statusCode >= 500 && response.statusCode < 600) {
    throw ServerErrorException(result['message']);
  } else {
    throw UnknownException(result['message']);
  }
}
