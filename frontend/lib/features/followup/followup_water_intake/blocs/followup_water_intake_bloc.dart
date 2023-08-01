import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/features/followup/followup_water_intake/data/models/followup_water_intake_model.dart';
import 'package:go_healthy/utils/shared_preference.dart';

part 'followup_water_intake_event.dart';
part 'followup_water_intake_state.dart';

class FollowupWaterIntakeBloc
    extends Bloc<FollowupWaterIntakeEvent, FollowupWaterIntakeState> {
  FollowupWaterIntakeBloc() : super(FollowupWaterIntakeInitialState()) {
    on<FollowupWaterIntakeInitialEvent>(_handleFollowupWaterIntakeInitialEvent);
    on<FollowupWaterIntakeAddQuantityEvent>(_handleFollowupWaterIntakeAddEvent);
    on<FollowupWaterIntakeRemoveQuantityEvent>(
        _handleFollowupWaterIntakeRemoveEvent);
    on<FollowupWaterIntakeChangeParamsEvent>(
        _handleFollowupWaterIntakeChangeParamsEvent);
  }

  // Loads the initial state of the bloc.
  FutureOr<void> _handleFollowupWaterIntakeInitialEvent(
      FollowupWaterIntakeInitialEvent event,
      Emitter<FollowupWaterIntakeState> emit) async {
    emit(FollowupWaterIntakeLoadingState());

    WaterIntakeModel waterIntake = await SharedPreference.getWaterIntake();

    emit(FollowupWaterIntakeInitialStateSuccess(waterIntake: waterIntake));
  }

  // On press, add the quantity to the list.
  FutureOr<void> _handleFollowupWaterIntakeAddEvent(
      FollowupWaterIntakeAddQuantityEvent event,
      Emitter<FollowupWaterIntakeState> emit) async {
    emit(FollowupWaterIntakeLoadingState());

    WaterIntakeModel waterIntakeInfo = await SharedPreference.getWaterIntake();
    waterIntakeInfo.waterIntake.add(event.quantity);
    await SharedPreference.setWaterIntake(waterIntakeInfo);
    waterIntakeInfo = await SharedPreference.getWaterIntake();

    emit(FollowupWaterIntakeAddQuantityActionState(
        waterIntake: waterIntakeInfo));
  }

  // On press, remove an instance of the quantity from the list.
  FutureOr<void> _handleFollowupWaterIntakeRemoveEvent(
      FollowupWaterIntakeRemoveQuantityEvent event,
      Emitter<FollowupWaterIntakeState> emit) async {
    emit(FollowupWaterIntakeLoadingState());
    WaterIntakeModel waterIntakeInfo = await SharedPreference.getWaterIntake();
    waterIntakeInfo.waterIntake.remove(event.quantity);
    await SharedPreference.setWaterIntake(waterIntakeInfo);

    emit(FollowupWaterIntakeRemoveQuantityActionState(
        waterIntake: waterIntakeInfo));
  }

  // Handles changing goal or step for the water intake.
  FutureOr<void> _handleFollowupWaterIntakeChangeParamsEvent(
      FollowupWaterIntakeChangeParamsEvent event,
      Emitter<FollowupWaterIntakeState> emit) async {
    emit(FollowupWaterIntakeLoadingState());

    WaterIntakeModel waterIntakeInfo = await SharedPreference.getWaterIntake();
    await SharedPreference.setWaterIntake(WaterIntakeModel(
        waterIntake: waterIntakeInfo.waterIntake,
        waterIntakeGoal: event.waterIntakeGoal,
        step: event.step));

    emit(FollowupWaterIntakeChangeParamsState(waterIntake: waterIntakeInfo));
  }
}
