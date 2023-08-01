import '../../../../../apI/api_client.dart';
import '../../../../../apI/api_endpoints.dart';

class LogoutRepository {
  Future<void> logout() async =>
      await APIClient.getHttpRequest<Map<String, dynamic>>(
        APIEndpoint.logout(),
      );
}
