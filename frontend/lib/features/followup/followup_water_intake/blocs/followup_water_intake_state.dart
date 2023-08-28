part of 'followup_water_intake_bloc.dart';

abstract class FollowupWaterIntakeState extends Equatable {
  const FollowupWaterIntakeState();

  @override
  List<Object> get props => <Object>[];
}

abstract class FollowupWaterIntakeActionState
    extends FollowupWaterIntakeState {}

class FollowupWaterIntakeInitialState extends FollowupWaterIntakeState {}

class FollowupWaterIntakeInitialStateSuccess extends FollowupWaterIntakeState {
  const FollowupWaterIntakeInitialStateSuccess({
    required this.waterIntake,
  });

  final WaterIntakeModel waterIntake;

  @override
  List<Object> get props => <Object>[waterIntake];
}

class FollowupWaterIntakeContainerInitialStateSuccess
    extends FollowupWaterIntakeState {}

class FollowupWaterIntakeLoadingState extends FollowupWaterIntakeState {}

class FollowupWaterIntakeSuccessState extends FollowupWaterIntakeActionState {}

class FollowupWaterIntakeErrorState extends FollowupWaterIntakeActionState {}

class FollowupWaterIntakeNavigateSelectQuantity
    extends FollowupWaterIntakeActionState {}

class FollowupWaterIntakeAddQuantityActionState
    extends FollowupWaterIntakeState {
  const FollowupWaterIntakeAddQuantityActionState({
    required this.waterIntake,
  });

  final WaterIntakeModel waterIntake;

  @override
  List<Object> get props => <Object>[waterIntake];
}

class FollowupWaterIntakeRemoveQuantityActionState
    extends FollowupWaterIntakeState {
  const FollowupWaterIntakeRemoveQuantityActionState({
    required this.waterIntake,
  });

  final WaterIntakeModel waterIntake;

  @override
  List<Object> get props => <Object>[waterIntake];
}

class FollowupWaterIntakeChangeParamsState extends FollowupWaterIntakeState {
  const FollowupWaterIntakeChangeParamsState({required this.waterIntake});

  final WaterIntakeModel waterIntake;

  @override
  List<Object> get props => <Object>[waterIntake];
}
