import '../../../../../apI/api_client.dart';
import '../../../../../apI/api_endpoints.dart';

class LogoutRepository {
  Future<void> logout() async =>
      await ApiClient.getHttpRequest<Map<String, dynamic>>(
        endpoint: ApiEndpoint.logout(),
      );
}
