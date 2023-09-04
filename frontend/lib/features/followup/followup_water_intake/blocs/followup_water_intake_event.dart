part of 'followup_water_intake_bloc.dart';

abstract class FollowupWaterIntakeEvent extends Equatable {
  const FollowupWaterIntakeEvent();

  @override
  List<Object> get props => <Object>[];
}

class FollowupWaterIntakeInitialEvent extends FollowupWaterIntakeEvent {
  @override
  List<Object> get props => <Object>[];
}

class FollowupWaterIntakeContainerInitialEvent
    extends FollowupWaterIntakeEvent {
  @override
  List<Object> get props => <Object>[];
}

class FollowupWaterIntakeButtonPressedEvent extends FollowupWaterIntakeEvent {
  @override
  List<Object> get props => <Object>[];
}

class FollowupWaterIntakeAddQuantityEvent extends FollowupWaterIntakeEvent {
  const FollowupWaterIntakeAddQuantityEvent({
    required this.quantity,
  });

  final double quantity;

  @override
  List<Object> get props => <Object>[quantity];
}

class FollowupWaterIntakeRemoveQuantityEvent extends FollowupWaterIntakeEvent {
  const FollowupWaterIntakeRemoveQuantityEvent({
    required this.quantity,
  });

  final double quantity;

  @override
  List<Object> get props => <Object>[quantity];
}

class FollowupWaterIntakeNavigateRegisterEvent
    extends FollowupWaterIntakeEvent {}

class FollowupWaterIntakeNavigateForgotPasswordEvent
    extends FollowupWaterIntakeEvent {}

class FollowupWaterIntakeChangeParamsEvent extends FollowupWaterIntakeEvent {
  const FollowupWaterIntakeChangeParamsEvent({
    required this.waterIntakeGoal,
    required this.step,
  });

  final double waterIntakeGoal;
  final double step;

  @override
  List<Object> get props => <Object>[waterIntakeGoal, step];
}
