import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitialState()) {
    on<SettingsInitialEvent>(_handleSettingsInitialEvent);
  }

  FutureOr<void> _handleSettingsInitialEvent(event, Emitter<SettingsState> emit) {
  }
}