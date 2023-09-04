import 'package:flutter/material.dart';
import 'package:go_healthy/shared/constants.dart';

import '../../../helpers/build_context_extensions.dart';
import '../../../utils/secure_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate!.appTitle),
      ),
      body: ElevatedButton(
        onPressed: () {
          print('Logout');
          //get secure storage
          context.navigateNamedRoute(AppRoute.LOGIN_ROUTE_NAME);
          SecureStorage.deleteAccessToken();
        },
        child: Text(context.translate!.logout),
      ),
    );
  }
}