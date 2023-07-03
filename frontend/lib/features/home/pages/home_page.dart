import 'package:flutter/material.dart';
import 'package:go_healthy/features/authentication/logout/blocs/logout_bloc.dart';
import 'package:go_healthy/shared/constants.dart';

import '../../../utils/build_context_extensions.dart';

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
          LogoutBloc().add(LogoutRequestEvent());
          context.navigateNamedRoute(AppRoute.LOGIN.name);
        },
        child: Text(context.translate!.logout),
      ),
    );
  }
}
