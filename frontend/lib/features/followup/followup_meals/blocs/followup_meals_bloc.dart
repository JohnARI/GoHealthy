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
      case FollowupMealType.Breakfast:
        emit(FollowupMealNavigateSelectMeal(redirectPage: "breakfast"));
        break;
      case FollowupMealType.Lunch:
        emit(FollowupMealNavigateSelectMeal(redirectPage: "lunch"));
        break;
      case FollowupMealType.Snack:
        emit(FollowupMealNavigateSelectMeal(redirectPage: "snac"));
        break;
      default:
        emit(FollowupMealNavigateSelectMeal(redirectPage: "dinner"));
        break;
    }
  }
}
