import 'package:flutter/material.dart';
import 'package:go_healthy/API/api_endpoints.dart';
import 'package:go_router/go_router.dart';

import '../API/api_client.dart';

final List<String> scope = <String>['f', 'b'];

GoRoute goRouteLoginCheckHelper(String name, String path, Widget returnWidget) {
  return GoRoute(
    name: name,
    path: path,
    builder: (BuildContext context, GoRouterState state) {
      if (scope.contains(name)) {
        return FutureBuilder<bool>(
          future: APIClient.getHttpRequest(APIEndpoint.getMe()),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData && snapshot.data!) {
              return returnWidget;
            } else {
              return const UnauthorizedPage();
            }
          },
        );
      } else {
        return returnWidget;
      }
    },
  );
}