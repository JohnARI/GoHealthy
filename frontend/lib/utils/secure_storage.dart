import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static const String _keyAccessToken = 'accessToken';
  static const String _keyRefreshToken = 'refreshToken';

  static Future<String?> getAccessToken() async =>
      await _storage.read(key: _keyAccessToken);

  static Future<void> setAccessToken(String accessToken) async =>
      await _storage.write(key: _keyAccessToken, value: accessToken);

  static Future<bool> hasAccessToken() async =>
      await _storage.containsKey(key: _keyAccessToken);


  static Future<void> deleteAccessToken() async =>
      await _storage.delete(key: _keyAccessToken);

  static Future<bool> getRefreshToken() async =>
      await _storage.read(key: _keyRefreshToken) != null;

  static Future<void> setRefreshToken(String refreshToken) async =>
      await _storage.write(key: _keyRefreshToken, value: refreshToken);

  static Future<void> deleteRefreshToken() async =>
      await _storage.delete(key: _keyRefreshToken);
}
