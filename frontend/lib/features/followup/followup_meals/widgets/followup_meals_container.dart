import 'package:flutter/material.dart';
import 'package:go_healthy/features/followup/followup_meals/widgets/followup_meals_widget.dart';
import 'package:go_healthy/shared/enums/followup_meal_enums.dart';
import 'package:go_healthy/shared/styles.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';

// ignore: must_be_immutable
class FollowupMealContainer extends StatelessWidget {
  const FollowupMealContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[AppStyle.shadow0],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          FollouwpMealWidget(
            mealType: FollowupMealType.Breakfast,
            meal: context.translate!.followupBreakfast,
            svgAssets: SvgAssets.breakfast2,
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          FollouwpMealWidget(
            mealType: FollowupMealType.Lunch,
            meal: context.translate!.followupLunch,
            svgAssets: SvgAssets.lunch2,
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          FollouwpMealWidget(
            mealType: FollowupMealType.Snack,
            meal: context.translate!.followupSnack,
            svgAssets: SvgAssets.snack,
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          FollouwpMealWidget(
            mealType: FollowupMealType.Dinner,
            meal: context.translate!.followupDinner,
            svgAssets: SvgAssets.dinner2,
          ),
        ],
      ),
    );
  }
}
