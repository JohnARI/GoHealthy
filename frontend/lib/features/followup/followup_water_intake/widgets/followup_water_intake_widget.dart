import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/features/followup/followup_water_intake/blocs/followup_water_intake_bloc.dart';
import 'package:go_healthy/shared/colors.dart';
import 'package:go_healthy/shared/svg_assets.dart';

class FollowupWaterIntakeWidget extends StatelessWidget {
  const FollowupWaterIntakeWidget(
      {super.key, required this.quantity, required this.onTapFunction});

  final double quantity;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    final FollowupWaterIntakeBloc followupWaterIntakeBloc =
        FollowupWaterIntakeBloc();

    return BlocConsumer<FollowupWaterIntakeBloc, FollowupWaterIntakeState>(
      bloc: followupWaterIntakeBloc,
      listener: (BuildContext context, FollowupWaterIntakeState state) {},
      builder: (BuildContext context, FollowupWaterIntakeState state) {
        if (state is FollowupWaterIntakeContainerInitialStateSuccess) {
          return _buildInitialState(context, followupWaterIntakeBloc);
        } else if (state is FollowupWaterIntakeLoadingState) {
          return _buildLoadingState();
        } else if (state is FollowupWaterIntakeErrorState) {
          return _buildErrorState();
        } else {
          return _buildInitialState(context, followupWaterIntakeBloc);
        }
      },
    );
  }

  Widget _buildInitialState(
      BuildContext context, FollowupWaterIntakeBloc bloc) {
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgAssets.buildSvg(
              path: SvgAssets.waterDropFilled, height: 50, width: 50),
          Baseline(
            baselineType: TextBaseline.alphabetic,
            baseline: 20.0,
            child: Text(
              '${quantity.toString()} L',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColor.BLACK5,
                  ),
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
