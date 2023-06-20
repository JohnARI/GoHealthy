import 'dart:convert';

class Login {
  final String access_token;

  Login({required this.access_token});

  Map<String, String> toMap() {
    return <String, String>{
      'email': access_token,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      access_token: map['access_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source));
}
