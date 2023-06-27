import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    on<RegisterInitialEvent>(_onRegisterInitialEvent);
    on<RegisterButtonPressedEvent>(_onRegisterButtonPressedEvent);
    on<RegisterNavigateLoginEvent>(_onRegisterNavigateLoginEvent);
  }

  FutureOr<void> _onRegisterInitialEvent(RegisterInitialEvent event, Emitter<RegisterState> emit) {
    emit(RegisterInitialState());
  }

  FutureOr<void> _onRegisterButtonPressedEvent(RegisterButtonPressedEvent event, Emitter<RegisterState> emit) {
    emit(RegisterLoadingState());
    emit(RegisterSuccessState());
  }

  FutureOr<void> _onRegisterNavigateLoginEvent(RegisterNavigateLoginEvent event, Emitter<RegisterState> emit) {
    emit(RegisterNavigateLoginActionState());
  }
}
