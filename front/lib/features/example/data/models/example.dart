import 'dart:convert';

class Example {
  final int userId;
  final int id;
  final String title;
  final String body;

  Example({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Example.fromMap(Map<String, dynamic> map) {
    return Example(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Example.fromJson(String source) => Example.fromMap(json.decode(source));

  
}
