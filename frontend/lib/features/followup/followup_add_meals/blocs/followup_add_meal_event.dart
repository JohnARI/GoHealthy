part of 'followup_add_meal_bloc.dart';

abstract class FollowupAddMealEvent extends Equatable {
  const FollowupAddMealEvent();

  @override
  List<Object> get props => <Object>[];
}

class FollowupAddMealsInitialEvent extends FollowupAddMealEvent {
  const FollowupAddMealsInitialEvent();
}
