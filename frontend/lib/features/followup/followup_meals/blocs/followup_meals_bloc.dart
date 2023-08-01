import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/shared/enums/followup_meal_enums.dart';

part 'followup_meals_event.dart';
part 'followup_meals_state.dart';

class FollowupMealBloc extends Bloc<FollowupMealEvent, FollowupMealState> {
  FollowupMealBloc() : super(FollowupMealInitialState()) {
    on<FollowupMealInitialEvent>(_handleFollowupMealInitialEvent);
    on<FollowupMealButtonPressedEvent>(
        _handleFollowupMealNavigateSelectMealButtonPressedEvent);
  }

  // Loads the initial state of the bloc.
  FutureOr<void> _handleFollowupMealInitialEvent(
      FollowupMealInitialEvent event, Emitter<FollowupMealState> emit) {
    emit(const FollowupMealInitialStateSuccess());
  }

  // On press, navigate to the select meal page.
  FutureOr<void> _handleFollowupMealNavigateSelectMealButtonPressedEvent(
      FollowupMealButtonPressedEvent event, Emitter<FollowupMealState> emit) {
    switch (event.mealType) {
      case FollowupMealType.breakfast:
        emit(FollowupMealNavigateSelectMealState(mealType: FollowupMealType.breakfast.name));
        break;
      case FollowupMealType.lunch:
        emit(FollowupMealNavigateSelectMealState(mealType: FollowupMealType.lunch.name));
        break;
      case FollowupMealType.snack:
        emit(FollowupMealNavigateSelectMealState(mealType: FollowupMealType.snack.name));
        break;
      default:
        emit(FollowupMealNavigateSelectMealState(mealType: FollowupMealType.dinner.name));
        break;
    }
  }
}
