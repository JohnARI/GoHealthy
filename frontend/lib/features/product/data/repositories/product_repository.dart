import 'dart:developer';

import '../../../../api/api_client.dart';
import '../../../../api/api_endpoints.dart';
import '../models/product.dart';

class ProductRepository {
  Future<Product> getProducts(String productId) async {
    try {
      log(
        name: 'Product repository',
        'login request started...',
      );

      final dynamic product =
          await ApiClient.getHttpRequest<Map<String, dynamic>>(
        endpoint: ApiEndpoint.getProductWithId(productId),
      );

      log(
        name: 'Product repository',
        'login request sent successfully',
      );

      final Product result = Product.fromMap(product);

      log(
        name: 'Product repository',
        'Converting response to Product model completed',
      );

      return result;
    } catch (error) {
      log(
        name: 'Product repository',
        error.toString(),
        error: error,
      );
      rethrow;
    }
  }

  Future<Product> createProduct(
      {required String title,
      required String type,
      String? description,
      required num energy,
      required num fat,
      required num saturatedFat,
      required num carbohydrates,
      required num sugars,
      required num protein,
      required num fiber,
      required num salt,
      required num averageMass,
      String? imageBucketId,
      required String userId}) async {
    try {
      log(
        name: 'Product repository',
        'login request started...',
      );

      final dynamic product =
          await ApiClient.postHttpRequest<Map<String, dynamic>>(
        endpoint: ApiEndpoint.createProduct(),
        body: <String, dynamic>{
          'title': title,
          'type': type,
          'description': description,
          'energy': energy,
          'fat': fat,
          'saturatedFat': saturatedFat,
          'carbohydrates': carbohydrates,
          'sugars': sugars,
          'protein': protein,
          'fiber': fiber,
          'salt': salt,
          'averageMass': averageMass,
          'imageBucketId': imageBucketId,
          'userId': userId,
        },
      );

      log(
        name: 'Product repository',
        'login request sent successfully',
      );

      final Product result = Product.fromMap(product);

      log(
        name: 'Product repository',
        'Converting response to Product model completed',
      );

      return result;
    } catch (error) {
      log(
        name: 'Product repository',
        error.toString(),
        error: error,
      );
      rethrow;
    }
  }
}
