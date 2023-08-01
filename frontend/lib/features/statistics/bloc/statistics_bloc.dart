import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'statistics_event.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(StatisticsInitialState()) {
    on<StatisticsInitialEvent>(_handleStatisticsInitialEvent);
  }

  FutureOr<void> _handleStatisticsInitialEvent(
      StatisticsInitialEvent event, Emitter<StatisticsState> emit) {}
}
