import 'package:http/http.dart' as http;

import '../../../../../API/api_endpoints.dart';
import '../../../../../API/api_providers.dart';
import '../../../../../helpers/api_helper.dart';
import '../models/register.dart';

class RegisterRepository {
  final http.Client client = APIProvider.getClient();
  Future<Register> login(String email, String username, String password) async {
    try {
      final http.Response response = await client.post(
        Uri.parse('${APIProvider.baseUrl}${APIEndpoint.users()}'),
        body: <String, String>{
          'email': email,
          'username': username,
          'password': password,
        },
      );

      final dynamic result = handleResponse(response);
      return Register.fromMap(result);
    } catch (e) {
      handleException(e);
      rethrow;
    }
  }
}
