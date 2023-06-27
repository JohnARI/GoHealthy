import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/secure_storage.dart';
import '../data/models/login.dart';
import '../data/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository = LoginRepository();
  LoginBloc() : super(LoginInitialState()) {
    on<LoginInitialEvent>(_handleLoginInitialEvent);
    on<LoginNavigateRegisterEvent>(_handleLoginNavigateRegisterEvent);
    on<LoginButtonPressedEvent>(_handleLoginButtonPressedEvent);
    on<LoginGoogleButtonPressedEvent>(_handleLoginGoogleButtonPressedEvent);
    on<LoginForgotPasswordButtonPressedEvent>(
        _handleLoginForgotPasswordButtonPressedEvent);
    on<LoginShowPasswordButtonPressedEvent>(
        _handleLoginShowPasswordButtonPressedEvent);
  }

  // Loads the initial state of the bloc.
  FutureOr<void> _handleLoginInitialEvent(
      LoginInitialEvent event, Emitter<LoginState> emit) {}

  // Handles the login button event.
  FutureOr<void> _handleLoginButtonPressedEvent(
      LoginButtonPressedEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoadingState());
      final Future<Login> accessToken = _loginRepository.login(
        event.email,
        event.password,
      );
      await accessToken.then((Login value) {
        SecureStorage.setAccessToken(value.accessToken);
        emit(LoginSuccessState());
      }).catchError((Object error) {
        emit(LoginErrorState());
      });
    } catch (e) {
      emit(LoginErrorState());
    }
  }

  // Handles the sign up button event.
  FutureOr<void> _handleLoginNavigateRegisterEvent(
      LoginNavigateRegisterEvent event, Emitter<LoginState> emit) {
    emit(LoginNavigateRegisterActionState());
  }

  // Handles the google login button event.
  FutureOr<void> _handleLoginGoogleButtonPressedEvent(
      LoginGoogleButtonPressedEvent event, Emitter<LoginState> emit) {}

  // Handles the forgot password event.
  FutureOr<void> _handleLoginForgotPasswordButtonPressedEvent(
      LoginForgotPasswordButtonPressedEvent event, Emitter<LoginState> emit) {}

  // Handles the show password event.
  FutureOr<void> _handleLoginShowPasswordButtonPressedEvent(
      LoginShowPasswordButtonPressedEvent event, Emitter<LoginState> emit) {}
}
