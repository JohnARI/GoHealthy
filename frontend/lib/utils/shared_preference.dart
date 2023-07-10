import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static late SharedPreferences _preferences;
  static const String _keyAccessToken = 'accessToken';
  static const String _keyRefreshToken = 'refreshToken';

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String? getAccessToken() {
    try {
      final String? accessToken = _preferences.getString(_keyAccessToken);
      log(name: 'SharedPreference', 'AccessToken : $accessToken');
      return accessToken;
    } catch (error) {
      log(name: 'SharedPreference', 'AccessToken failed to load : $error');
      rethrow;
    }
  }

  static Future<void> setAccessToken(String accessToken) async {
    try {
      await _preferences.setString(_keyAccessToken, accessToken);
      log(name: 'SharedPreference', 'set AccessToken : $accessToken');
    } catch (error) {
      log(name: 'SharedPreference', 'AccessToken failed to save : $error');
      rethrow;
    }
  }


  static Future<void> deleteAccessToken() async {
    try {
      final Future<bool> accessToken = _preferences.remove(_keyAccessToken);
      log(name: 'SharedPreference', 'deleted AccessToken : $accessToken');
    } catch (error) {
      log(name: 'SharedPreference', 'AccessToken failed to delete : $error');
      rethrow;
    }
  }

  static String? getRefreshToken() {
    try {
      final String? refreshToken = _preferences.getString(_keyRefreshToken);
      log(name: 'SharedPreference', 'RefreshToken : $refreshToken');
      return refreshToken;
    } catch (error) {
      log(name: 'SharedPreference', 'RefreshToken failed to load : $error');
      rethrow;
    }
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    try {
      await _preferences.setString(_keyRefreshToken, refreshToken);
      log(name: 'SharedPreference', 'set RefreshToken : $refreshToken');
    } catch (error) {
      log(name: 'SharedPreference', 'RefreshToken failed to save : $error');
      rethrow;
    }
  }

  static Future<void> deleteRefreshToken() async {
    try {
      final Future<bool> refreshToken = _preferences.remove(_keyRefreshToken);
      log(name: 'SharedPreference', 'deleted RefreshToken : $refreshToken');
    } catch (error) {
      log(name: 'SharedPreference', 'RefreshToken failed to delete : $error');
      rethrow;
    }
  }
}