import 'dart:convert';
import 'dart:developer';

class Product {
  // TODO: Uncomment when API is ready
  // final int? statusCode;
  final String? id;
  final String? title;
  final String? type;
  final String? description;
  final num? energy;
  final num? fat;
  final num? saturatedFat;
  final num? carbohydrates;
  final num? sugars;
  final num? protein;
  final num? fiber;
  final num? salt;
  final num? averageMass;
  final String? imageBucketId;
  final String? userId;

  Product({
    // TODO: Uncomment when API is ready
    // required this.statusCode,
    this.id,
    this.title,
    this.type,
    this.description,
    this.energy,
    this.fat,
    this.saturatedFat,
    this.carbohydrates,
    this.sugars,
    this.protein,
    this.fiber,
    this.salt,
    this.averageMass,
    this.imageBucketId,
    this.userId,
  });

  Map<String, String> toMap() {
    log(name: 'Login model', 'Converting Product model to map started...');
    return <String, String>{
      // TODO: Uncomment when API is ready
      // 'statusCode': statusCode.toString(),
      'id': id ?? '',
      'title': title ?? '',
      'type': type ?? '',
      'description': description ?? '',
      'energy': energy.toString(),
      'fat': fat.toString(),
      'saturatedFat': saturatedFat.toString(),
      'carbohydrates': carbohydrates.toString(),
      'sugars': sugars.toString(),
      'protein': protein.toString(),
      'fiber': fiber.toString(),
      'salt': salt.toString(),
      'averageMass': averageMass.toString(),
      'imageBucketId': imageBucketId ?? '',
      'userId': userId ?? '',
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    log(name: 'Login model', 'Converting map to Product model started...');
    return Product(
      // TODO: Uncomment when API is ready
      // statusCode: map['statusCode'] ?? 0,
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      energy: map['energy'] ?? 0.0,
      fat: map['fat'] ?? 0.0,
      saturatedFat: map['saturatedFat'] ?? 0.0,
      carbohydrates: map['carbohydrates'] ?? 0.0,
      sugars: map['sugars'] ?? 0.0,
      protein: map['protein'] ?? 0.0,
      fiber: map['fiber'] ?? 0.0,
      salt: map['salt'] ?? 0.0,
      averageMass: map['averageMass'] ?? 0.0,
      imageBucketId: map['imageBucketId'] ?? '',
      userId: map['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));



}
