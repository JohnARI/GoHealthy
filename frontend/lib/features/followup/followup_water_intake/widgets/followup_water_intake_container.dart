import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/features/followup/followup_water_intake/blocs/followup_water_intake_bloc.dart';
import 'package:go_healthy/features/followup/followup_water_intake/data/models/followup_water_intake_model.dart';
import 'package:go_healthy/features/followup/followup_water_intake/widgets/followup_water_intake_modal.dart';
import 'package:go_healthy/features/followup/followup_water_intake/widgets/followup_water_intake_widget.dart';
import 'package:go_healthy/shared/colors.dart';
import 'package:go_healthy/shared/styles.dart';
import 'package:go_healthy/shared/svg_assets.dart';

class FollowupWaterIntakeContainer extends StatelessWidget {
  const FollowupWaterIntakeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final FollowupWaterIntakeBloc followupWaterIntakeBloc =
        FollowupWaterIntakeBloc();
    followupWaterIntakeBloc.add(FollowupWaterIntakeInitialEvent());
    late WaterIntakeModel waterIntake =
        WaterIntakeModel(waterIntake: <double>[], waterIntakeGoal: 0, step: 0);

    return BlocConsumer<FollowupWaterIntakeBloc, FollowupWaterIntakeState>(
      bloc: followupWaterIntakeBloc,
      listener: (BuildContext context, FollowupWaterIntakeState state) {
        if (state is FollowupWaterIntakeChangeParamsState) {
          waterIntake.waterIntakeGoal = state.waterIntake.waterIntakeGoal;
          waterIntake.step = state.waterIntake.step;
        }
        if (state is FollowupWaterIntakeAddQuantityActionState) {
          waterIntake = state.waterIntake;
        }
        if (state is FollowupWaterIntakeRemoveQuantityActionState) {
          waterIntake = state.waterIntake;
        }
        if (state is FollowupWaterIntakeInitialStateSuccess) {
          waterIntake = state.waterIntake;
        }
      },
      builder: (BuildContext context, FollowupWaterIntakeState state) {
        if (state is FollowupWaterIntakeContainerInitialStateSuccess) {
          return _buildInitialState(
              context, followupWaterIntakeBloc, waterIntake);
        } else if (state is FollowupWaterIntakeLoadingState) {
          return _buildLoadingState();
        } else if (state is FollowupWaterIntakeErrorState) {
          return _buildErrorState();
        } else {
          return _buildInitialState(
              context, followupWaterIntakeBloc, waterIntake);
        }
      },
    );
  }

  Widget _buildInitialState(BuildContext context, FollowupWaterIntakeBloc bloc,
      WaterIntakeModel waterIntake) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 0,
        top: 10,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[AppStyle.shadow0],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SvgAssets.buildSvg(
                      path: SvgAssets.waterGlass, height: 30, width: 30),
                  const SizedBox(width: 10),
                  Baseline(
                    baselineType: TextBaseline.alphabetic,
                    baseline: 20.0,
                    child: Text('Water intake',
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  WaterIntakeModal(context, waterIntake, bloc);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    AppColor.WHITE,
                  ),
                  shape: MaterialStateProperty.all<CircleBorder>(
                    const CircleBorder(),
                  ),
                ),
                child: const Icon(Icons.more_horiz, color: AppColor.BLACK4),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Baseline(
                baselineType: TextBaseline.alphabetic,
                baseline: 20.0,
                child: Text(
                    waterIntake.waterIntake.isNotEmpty
                        ? waterIntake.waterIntake
                            .reduce((double value, double element) =>
                                value + element)
                            .round()
                            .toString()
                        : '0',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColor.BLUE1)),
              ),
              Baseline(
                baselineType: TextBaseline.alphabetic,
                baseline: 16.0,
                child: Text(
                    ' / ${waterIntake.waterIntakeGoal.round().toString()} mL',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColor.BLACK5)),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 20,
                  runSpacing: 10,
                  children: <Widget>[
                    ...waterIntake.waterIntake.map((double quantity) {
                      return FollowupWaterIntakeWidget(
                        quantity: quantity,
                        onTapFunction: () {
                          bloc.add(FollowupWaterIntakeRemoveQuantityEvent(
                              quantity: quantity));
                        },
                      );
                    }).toList(),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.BLUE1,
                          ),
                          shape: MaterialStateProperty.all<CircleBorder>(
                            const CircleBorder(),
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () {
                        bloc.add(FollowupWaterIntakeAddQuantityEvent(
                            quantity: waterIntake.step));
                      },
                      child: const Icon(
                        Icons.add,
                        color: AppColor.WHITE,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
