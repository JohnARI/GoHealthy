import 'dart:convert';

class Register {
  final String id;
  final String email;
  final String password;

  Register({required this.id, required this.email, required this.password});

  Map<String, String> toMap() {
    return <String, String>{
      'id': id,
      'email': email,
      'password': password,
    };
  }

  factory Register.fromMap(Map<String, dynamic> map) {
    return Register(
      id: map['id'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Register.fromJson(String source) =>
      Register.fromMap(json.decode(source));
}
