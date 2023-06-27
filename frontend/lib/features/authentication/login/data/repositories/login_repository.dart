import 'dart:developer';

import 'package:go_healthy/API/api_client.dart';
import 'package:go_healthy/API/api_endpoints.dart';

import '../models/login.dart';

class LoginRepository {
  Future<Login> login(String email, String password) async {
    try {
      final dynamic login =
          await APIClient.postHttpRequest<Map<String, dynamic>>(
        APIEndpoint.login(),
        <String, dynamic>{
          'email': 'john.aristosa@hotmail.com',
          'password': 'John123.',
        },
        includeHeaders: false,
      );
      log(login.toString());
      final Login result = Login.fromMap(login);
      return result;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
