import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/shared/colors.dart';
import 'package:go_healthy/shared/enums/followup_meal_enums.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';

import '../blocs/followup_meals_bloc.dart';

// ignore: must_be_immutable
class FollouwpMealWidget extends StatelessWidget {
  FollouwpMealWidget(
      {super.key,
      required this.mealType,
      required this.meal,
      required this.svgAssets});

  final FollowupMealType mealType;
  final String meal;
  final String svgAssets;

  late double minValue = 0;
  late double maxValue = 0;

  @override
  Widget build(BuildContext context) {
    final FollowupMealBloc followupMealBloc = FollowupMealBloc();

    // pieChartBloc.add(PieChartContainerInitialEvent(type: type));

    return BlocConsumer<FollowupMealBloc, FollowupMealState>(
      bloc: followupMealBloc,
      listener: (BuildContext context, FollowupMealState state) {
        if (state is FollowupMealNavigateSelectMeal) {
          context.navigateNamedRoute('/followup/${state.redirectPage}');
        }
        if (state is FollowupMealContainerInitialStateSuccess) {
          // TODO: Fetch from the back the values for the max and min values.
        }
      },
      builder: (BuildContext context, FollowupMealState state) {
        if (state is FollowupMealContainerInitialStateSuccess) {
          return _buildInitialState(context, svgAssets, followupMealBloc);
        } else if (state is FollowupMealLoadingState) {
          return _buildLoadingState();
        } else if (state is FollowupMealErrorState) {
          return _buildErrorState();
        } else {
          return _buildInitialState(context, svgAssets, followupMealBloc);
        }
      },
    );
  }

  Widget _buildInitialState(BuildContext context, String svgAssets,
      FollowupMealBloc followupMealBloc) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 40,
                height: 40,
                child: SvgAssets.buildSvg(path: svgAssets, height: 40),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${context.translate!.followupAddMeal} $meal',
                      style: Theme.of(context).textTheme.titleSmall),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Baseline(
                        baselineType: TextBaseline.alphabetic,
                        baseline: 20.0,
                        child: Text(minValue.round().toString(),
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      Baseline(
                        baselineType: TextBaseline.alphabetic,
                        baseline: 16.0,
                        child: Text(' / 2500 kcal',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColor.BLACK5)),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<CircleBorder>(
                const CircleBorder(),
              ),
            ),
            onPressed: () {
              followupMealBloc
                  .add(FollowupMealButtonPressedEvent(mealType: mealType));
            },
            child: const Icon(
              Icons.add,
              color: AppColor.WHITE,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState() {
    return const Center(
      child: Text('Error'),
    );
  }
}
