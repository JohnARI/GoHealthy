import 'dart:developer';

import 'package:go_healthy/API/api_client.dart';
import 'package:go_healthy/API/api_endpoints.dart';

import '../models/login.dart';

class LoginRepository {
  Future<Login> login(String email, String password) async {
    try {
      log(
        name: 'Login repository',
        'login request started...',
      );
      final dynamic login =
          await APIClient.postHttpRequest<Map<String, dynamic>>(
        APIEndpoint.login(),
        <String, dynamic>{
          'email': email,
          'password': password,
        },
        includeHeaders: false,
      );
      log(
        name: 'Login repository',
        'login request sent successfully',
      );
      log(
        name: 'Login repository',
        'Converting response to Login model started...',
      );
      final Login result = Login.fromMap(login);
      log(
        name: 'Login repository',
        'Converting response to Login model completed',
      );
      return result;
    } catch (e) {
      log(
        name: 'Login repository',
        e.toString(),
        error: e,
      );
      rethrow;
    }
  }
}
