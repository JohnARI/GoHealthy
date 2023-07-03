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
    final String? accessToken = _preferences.getString(_keyAccessToken);
    log(name: 'SharedPreference', 'AccessToken retrieved successfully');
    return accessToken;
  }

  static Future<void> setAccessToken(String accessToken) async {
    await _preferences.setString(_keyAccessToken, accessToken);
    log(name: 'SharedPreference', 'AccessToken saved successfully');
  }

  static Future<void> deleteAccessToken() async {
    await _preferences.remove(_keyAccessToken);
    log(name: 'SharedPreference', 'AccessToken deleted successfully');
  }

  static String? getRefreshToken() {
    final String? refreshToken = _preferences.getString(_keyRefreshToken);
    log(name: 'SharedPreference', 'RefreshToken retrieved successfully');
    return refreshToken;
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    await _preferences.setString(_keyRefreshToken, refreshToken);
    log(name: 'SharedPreference', 'RefreshToken saved successfully');
  }

  static Future<void> deleteRefreshToken() async {
    await _preferences.remove(_keyRefreshToken);
    log(name: 'SharedPreference', 'RefreshToken deleted successfully');
  }
}
