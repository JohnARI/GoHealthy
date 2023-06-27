import 'dart:convert';

class Register {
  final String id;
  final String email;
  final String username;

  Register({required this.id, required this.email, required this.username});

  Map<String, String> toMap() {
    return <String, String>{
      'id': id,
      'email': email,
      'username': username,
    };
  }

  factory Register.fromMap(Map<String, dynamic> map) {
    return Register(
      id: map['id'],
      email: map['email'],
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Register.fromJson(String source) =>
      Register.fromMap(json.decode(source));
}
