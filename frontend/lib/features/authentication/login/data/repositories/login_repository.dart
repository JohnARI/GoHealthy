import 'dart:developer';

import 'package:go_healthy/apI/api_client.dart';
import 'package:go_healthy/apI/api_endpoints.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../apI/api_google.dart';
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
      final Login result = Login.fromMap(login);
      log(
        name: 'Login repository',
        'Converting response to Login model completed',
      );
      return result;
    } catch (error) {
      log(
        name: 'Login repository',
        error.toString(),
        error: error,
      );
      rethrow;
    }
  }

  Future<Login> loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await APIGoogle.signIn();

      if (googleUser == null) {
        log(name: 'LoginBLoC', 'The user cancelled the login');
        throw Exception('The user cancelled the login');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? accessToken = googleAuth.accessToken;
      final String? idToken = googleAuth.idToken;
      log(
        name: 'Login repository',
        'Google login request started...',
      );
      final Map<String, dynamic> googleSigninRequest = await APIClient.postHttpRequest<Map<String, dynamic>>(
        APIEndpoint.loginGoogle(),
        <String, dynamic>{
          'access_token': accessToken,
          'id_token': idToken,
        },
        includeHeaders: false,
      );

      final Login result = Login.fromMap(googleSigninRequest);
      // translate to login model
      log(
        name: 'Login repository',
        'Google login request sent successfully',
      );

      return result;
    } catch (error) {
      rethrow;
    }
  }
}
