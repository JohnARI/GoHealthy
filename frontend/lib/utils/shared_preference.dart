import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

/// Provides access to Shared Preferences for storing and retrieving data.
///
/// The [SharedPreference] class allows the application to store and retrieve
/// data using the SharedPreferences package. It provides methods for initializing,
/// getting, setting, and deleting access and refresh tokens.
class SharedPreference {
  static late SharedPreferences _preferences;
  static const String _keyAccessToken = 'accessToken';
  static const String _keyRefreshToken = 'refreshToken';

  /// Initializes the Shared Preferences instance.
  ///
  /// This method initializes the SharedPreferences instance to allow the
  /// application to store and retrieve data using SharedPreferences.
  /// It logs the initialization process for debugging purposes.
  static Future<void> initialize() async {
    try {
      _preferences = await SharedPreferences.getInstance();
      log(name: 'SharedPreference', 'initialized');
    } catch (error, stackTrace) {
      log(
        name: 'SharedPreference',
        'failed to initialize : $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Gets the access token from Shared Preferences.
  ///
  /// This method retrieves the access token stored in Shared Preferences.
  /// It logs the retrieval process for debugging purposes and returns the access token.
  static String? getAccessToken() {
    try {
      final String? accessToken = _preferences.getString(_keyAccessToken);
      log(name: 'SharedPreference', 'AccessToken : $accessToken');
      return accessToken;
    } catch (error, stackTrace) {
      log(
        name: 'SharedPreference',
        'AccessToken failed to load : $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Sets the access token in Shared Preferences.
  ///
  /// This method stores the provided access token in Shared Preferences.
  /// It logs the setting process for debugging purposes.
  static Future<void> setAccessToken(String? accessToken) async {
    try {
      assert(accessToken != null, 'Access token must not be null.');
      await _preferences.setString(_keyAccessToken, accessToken!);
      log(name: 'SharedPreference', 'set AccessToken : $accessToken');
    } catch (error, stackTrace) {
      log(
        name: 'SharedPreference',
        'AccessToken failed to save : $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Deletes the access token from Shared Preferences.
  ///
  /// This method removes the access token stored in Shared Preferences.
  /// It logs the deletion process for debugging purposes.
  static Future<void> deleteAccessToken() async {
    try {
      await _preferences.remove(_keyAccessToken);
      log(name: 'SharedPreference', 'deleted AccessToken');
    } catch (error, stackTrace) {
      log(
        name: 'SharedPreference',
        'AccessToken failed to delete : $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Gets the refresh token from Shared Preferences.
  ///
  /// This method retrieves the refresh token stored in Shared Preferences.
  /// It logs the retrieval process for debugging purposes and returns the refresh token.
  static String? getRefreshToken() {
    try {
      final String? refreshToken = _preferences.getString(_keyRefreshToken);
      log(name: 'SharedPreference', 'RefreshToken : $refreshToken');
      return refreshToken;
    } catch (error, stackTrace) {
      log(
        name: 'SharedPreference',
        'RefreshToken failed to load : $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Sets the refresh token in Shared Preferences.
  ///
  /// This method stores the provided refresh token in Shared Preferences.
  /// It logs the setting process for debugging purposes.
  static Future<void> setRefreshToken(String? refreshToken) async {
    try {
      assert(refreshToken != null, 'Refresh token must not be null.');
      await _preferences.setString(_keyRefreshToken, refreshToken!);
      log(name: 'SharedPreference', 'set RefreshToken : $refreshToken');
    } catch (error, stackTrace) {
      log(
        name: 'SharedPreference',
        'RefreshToken failed to save : $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Deletes the refresh token from Shared Preferences.
  ///
  /// This method removes the refresh token stored in Shared Preferences.
  /// It logs the deletion process for debugging purposes.
  static Future<void> deleteRefreshToken() async {
    try {
      await _preferences.remove(_keyRefreshToken);
      log(name: 'SharedPreference', 'deleted RefreshToken');
    } catch (error, stackTrace) {
      log(
        name: 'SharedPreference',
        'RefreshToken failed to delete : $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
