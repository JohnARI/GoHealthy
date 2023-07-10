import '../../../../../API/api_client.dart';
import '../../../../../API/api_endpoints.dart';

class LogoutRepository {
  Future<void> logout() async =>
      await APIClient.getHttpRequest<Map<String, dynamic>>(
        APIEndpoint.logout(),
      );
}
