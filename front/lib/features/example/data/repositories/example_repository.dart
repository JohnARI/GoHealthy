import 'package:go_healthy/API/api_endpoints.dart';

import '../../../../API/api_client.dart';
import '../models/example.dart';

/// This class is used as an example of how to use the API Client
class ExampleRepository {
  final APIClient _apiClient;
  ExampleRepository({APIClient? apiClient})
      : _apiClient = apiClient ?? APIClient();
  Future<Example> getExample() async {
    try {
      final dynamic response = await _apiClient.getRequest(
        APIEndpoint.posts(),
        includeHeaders: false,
      );
      return response
          .map<Example>((dynamic item) => Example.fromMap(item))
          .toList();
    } catch (e) {
      throw Exception('Repository: $e');
    }
  }

  Future<Example> postExample(Example example) async {
    try {
      final dynamic response =
          await _apiClient.postRequest(APIEndpoint.example(), example.toMap());

      return Example.fromMap(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Example> putExample(Example example) async {
    try {
      final dynamic response = await _apiClient.putRequest(
        APIEndpoint.exampleWithId(example.id),
        example.toMap(),
      );

      return Example.fromMap(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Example> deleteExample(int id) async {
    try {
      final dynamic response =
          await _apiClient.deleteRequest(APIEndpoint.exampleWithId(id));

      return Example.fromMap(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Example> patchExample(Example example) async {
    try {
      final dynamic response = await _apiClient.patchRequest(
        APIEndpoint.exampleWithId(example.id),
        example.toMap(),
      );

      return Example.fromMap(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  void dispose() {
    _apiClient.dispose();
  }
}
