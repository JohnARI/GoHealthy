import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pie_chart_event.dart';
part 'pie_chart_state.dart';

class PieChartBloc extends Bloc<PieChartEvent, PieChartState> {
  PieChartBloc() : super(PieChartInitialState()) {
    on<PieChartInitialEvent>(_handlePieChartInitialEvent);
  }

  // Loads the initial state of the bloc.
  FutureOr<void> _handlePieChartInitialEvent(
      PieChartInitialEvent event, Emitter<PieChartState> emit) {
    double minValue = event.minValue;
    double restValue = event.maxValue - event.minValue;

    emit(PieChartInitialStateSuccess(
        percentValueFilled: minValue, percentValueUnfilled: restValue));
  }
}
