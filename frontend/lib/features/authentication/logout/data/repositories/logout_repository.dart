import '../../../../../API/api_client.dart';
import '../../../../../API/api_endpoints.dart';

class LogoutRepository {

  Future<void> logout() async {
    final dynamic logout = await APIClient.getHttpRequest<Map<String, dynamic>>(
      APIEndpoint.logout(),
    );

    print(logout);
  }
}