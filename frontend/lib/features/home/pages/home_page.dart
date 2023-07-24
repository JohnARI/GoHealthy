import 'package:flutter/material.dart';
import 'package:go_healthy/features/authentication/logout/blocs/logout_bloc.dart';
import 'package:go_healthy/features/graphs/pie_chart/widgets/pie_chart_container.dart';
import 'package:go_healthy/shared/constants.dart';

import '../../../utils/build_context_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColor.BLACK8,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppStyle.HORIZONTAL_PADDING,
            vertical: AppStyle.VERTICAL_PADDING,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: const <Widget>[
                  PieChartContainer(title: "Carbs"),
                  PieChartContainer(title: "Proteins"),
                  PieChartContainer(title: "Lipids"),
                  PieChartContainer(title: "Calories"),
                ],
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
      ),
    );
  }
}
