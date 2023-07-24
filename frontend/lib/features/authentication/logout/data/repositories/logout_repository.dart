import '../../../../../api/api_client.dart';
import '../../../../../api/api_endpoints.dart';

class LogoutRepository {
  Future<void> logout() async =>
      await APIClient.getHttpRequest<Map<String, dynamic>>(
        APIEndpoint.logout(),
      );
}
