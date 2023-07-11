import 'package:flutter/material.dart';
import 'package:go_healthy/features/authentication/logout/blocs/logout_bloc.dart';
import 'package:go_healthy/shared/constants.dart';

import '../../../utils/build_context_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyle.HORIZONTAL_PADDING,
          vertical: AppStyle.VERTICAL_PADDING,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: AppColor.BLACK8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "test",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.red,
                  ),
            ),
            ElevatedButton(
              onPressed: () {
                LogoutBloc().add(LogoutRequestEvent());
                context.navigateNamedRoute(AppRoute.LOGIN.name);
              },
              child: Text(context.translate!.logout),
            ),
          ],
        ),
      ),
    );
  }
}
