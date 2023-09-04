import 'package:flutter/material.dart';
import 'package:go_healthy/features/followup/followup_water_intake/blocs/followup_water_intake_bloc.dart';
import 'package:go_healthy/features/followup/followup_water_intake/data/models/followup_water_intake_model.dart';
import 'package:go_healthy/shared/colors.dart';
import 'package:go_healthy/widgets/buttons.dart';
import 'package:go_healthy/widgets/inputs.dart';

void WaterIntakeModal(BuildContext context, WaterIntakeModel waterIntake,
    FollowupWaterIntakeBloc bloc) {
  final TextEditingController goal = TextEditingController();
  final TextEditingController step = TextEditingController();

  showModalBottomSheet<Widget>(
    elevation: 0,
    barrierColor: AppColor.BLACK3.withOpacity(.3),
    isScrollControlled: true,
    backgroundColor: AppColor.WHITE,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)),
    ),
    context: context,
    builder: (BuildContext context) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Set up my water intake',
                    style: Theme.of(context).textTheme.titleMedium),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: InputText(
                        placeholder:
                            waterIntake.waterIntakeGoal.round().toString(),
                        targetVariable: goal,
                        isNumeric: true,
                        maxLength: 10000,
                        isCentered: true,
                        label: "Goal (mL)",
                      ),
                    ),
                    const SizedBox(width: 30),
                    SizedBox(
                      width: 100,
                      child: InputText(
                        placeholder: waterIntake.step.round().toString(),
                        targetVariable: step,
                        isNumeric: true,
                        maxLength: 10000,
                        isCentered: true,
                        label: "Step (mL)",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 110,
                      child: AppOutlinedButton(
                        onPressed: () {
                          goal.clear();
                          step.clear();
                        },
                        text: "Reset",
                      ),
                    ),
                    const SizedBox(width: 20),
                    AppFilledButton(
                      onPressed: () {
                        bloc.add(
                          FollowupWaterIntakeChangeParamsEvent(
                            waterIntakeGoal: double.tryParse(goal.text) ??
                                waterIntake.waterIntakeGoal,
                            step:
                                double.tryParse(step.text) ?? waterIntake.step,
                          ),
                        );
                      },
                      text: "Save",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
