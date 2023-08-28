import 'package:flutter/material.dart';
import 'package:go_healthy/features/followup/followup_meals/widgets/followup_meals_container.dart';
import 'package:go_healthy/features/followup/followup_water_intake/widgets/followup_water_intake_container.dart';
import 'package:go_healthy/features/authentication/logout/blocs/logout_bloc.dart';
import 'package:go_healthy/features/followup/followup_meals/widgets/followup_meals_container.dart';
import 'package:go_healthy/features/graphs/pie_chart/widgets/pie_chart_container.dart';
import 'package:go_healthy/shared/constants.dart';
import 'package:go_healthy/shared/enums/pie_charts_enums.dart';
import 'package:go_healthy/shared/svg_assets.dart';

import '../../../utils/build_context_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      decoration: const BoxDecoration(
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
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: (context.screenWidth / 2 - 30) / 107,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  PieChartContainer(
                      type: PieChartType.Carbs,
                      title: context.translate!.followupPieChartTitleCarbs,
                      primaryColor: AppColor.BLUE0,
                      secondaryColor: AppColor.BLUE2,
                      svgAssets: SvgAssets.carbs),
                  PieChartContainer(
                      type: PieChartType.Proteins,
                      title: context.translate!.followupPieChartTitleProteins,
                      primaryColor: AppColor.GREEN6,
                      secondaryColor: AppColor.GREEN8,
                      svgAssets: SvgAssets.protein),
                  PieChartContainer(
                      type: PieChartType.Lipids,
                      title: context.translate!.followupPieChartTitleLipids,
                      primaryColor: AppColor.YELLOW0,
                      secondaryColor: AppColor.YELLOW1,
                      svgAssets: SvgAssets.fat),
                  PieChartContainer(
                      type: PieChartType.Calories,
                      title: context.translate!.followupPieChartTitleCalories,
                      primaryColor: AppColor.ORANGE0,
                      secondaryColor: AppColor.ORANGE1,
                      svgAssets: SvgAssets.calories),
                ],
              ),
              const SizedBox(height: 20),
              const FollowupMealContainer(),
              const SizedBox(height: 20),
              const FollowupWaterIntakeContainer(),
              // ElevatedButton(
              //   onPressed: () {
              //     LogoutBloc().add(LogoutRequestEvent());
              //     context.navigateNamedRoute(AppRoute.LOGIN.name);
              //   },
              //   child: Text(context.translate!.logout),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
