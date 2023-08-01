import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/shared_preference.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutRequestEvent>(_onLogoutRequestEvent);
  }

  FutureOr<void> _onLogoutRequestEvent(
      LogoutRequestEvent event, Emitter<LogoutState> emit) async {
    emit(LogoutLoadingState());
    SharedPreference.deleteAccessToken();
    SharedPreference.deleteRefreshToken();
    log(name: 'LogoutBLoC', 'LogoutSuccessState');
    emit(LogoutSuccessState());
  }
}
