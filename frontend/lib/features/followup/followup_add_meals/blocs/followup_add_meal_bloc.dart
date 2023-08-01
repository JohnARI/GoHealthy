import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'followup_add_meal_event.dart';
part 'followup_add_meal_state.dart';

class FollowupAddMealBloc
    extends Bloc<FollowupAddMealEvent, FollowupAddMealState> {
  FollowupAddMealBloc() : super(FollowupAddMealsInitialState()) {
    on<FollowupAddMealsInitialEvent>(_handleFollowupAddMealsInitialEvent);
  }

  FutureOr<void> _handleFollowupAddMealsInitialEvent(
      FollowupAddMealsInitialEvent event, Emitter<FollowupAddMealState> emit) {}
}
