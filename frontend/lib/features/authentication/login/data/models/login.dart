import 'dart:convert';

class Login {
  final String accessToken;
  final String refreshToken;

  Login({required this.accessToken, required this.refreshToken});

  Map<String, String> toMap() {
    return <String, String>{
      'access_token': accessToken,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      accessToken: map['access_token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source));
}
