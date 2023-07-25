part of 'followup_meals_bloc.dart';

abstract class FollowupMealEvent extends Equatable {
  const FollowupMealEvent();

  @override
  List<Object> get props => <Object>[];
}

class FollowupMealInitialEvent extends FollowupMealEvent {
  const FollowupMealInitialEvent({required this.type});

  final FollowupMealType type;

  @override
  List<Object> get props => <Object>[type];
}

class FollowupMealContainerInitialEvent extends FollowupMealEvent {
  const FollowupMealContainerInitialEvent({required this.type});

  final FollowupMealType type;

  @override
  List<Object> get props => <Object>[type];
}

class FollowupMealButtonPressedEvent extends FollowupMealEvent {
  const FollowupMealButtonPressedEvent({
    required this.mealType,
  });

  final FollowupMealType mealType;

  @override
  List<Object> get props => <Object>[mealType];
}

class FollowupMealShowPasswordButtonPressedEvent extends FollowupMealEvent {}

class FollowupMealNavigateRegisterEvent extends FollowupMealEvent {}

class FollowupMealNavigateForgotPasswordEvent extends FollowupMealEvent {}

class FollowupMealNavigateGoogleEvent extends FollowupMealEvent {}
