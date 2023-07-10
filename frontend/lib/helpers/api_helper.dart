import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../utils/api_exceptions.dart';

dynamic handleResponse(http.Response response) {
  log(
    name: 'APIHelper',
    'Converting response...',
  );
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(response.body);
  } else if (response.statusCode == 401) {
    throw UnauthorizedException('Unauthorized');
  } else if (response.statusCode == 404) {
    throw NotFoundException('Resource not found');
  } else if (response.statusCode == 400) {
    throw BadRequestException('Bad request');
  } else if (response.statusCode == 500) {
    throw ServerErrorException('Server error');
  } else {
    throw UnknownException('Unknown error occurred');
  }
}

// TODO: Update this method to handle API exceptions
void handleException(dynamic e) {
  if (e is http.ClientException) {
    throw NoInternetException('No internet connection');
  } else if (e is TimeoutException) {
    throw TimeOutException('Request timed out');
  } else {
    throw UnknownException('Unknown error occurred');
  }
}
