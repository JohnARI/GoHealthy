import 'dart:convert';
import 'dart:developer';

class Login {
  final String accessToken;
  final String refreshToken;

  Login({required this.accessToken, required this.refreshToken});

  Map<String, String> toMap() {
    log(name: 'Login model', 'Converting Login model to map started...');
    return <String, String>{
      'access_token': accessToken,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    log(name: 'Login model', 'Converting map to Login model started...');
    return Login(
      accessToken: map['access_token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source));
}
