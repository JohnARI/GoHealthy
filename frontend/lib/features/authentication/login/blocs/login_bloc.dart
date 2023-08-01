import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/features/authentication/login/data/models/login.dart';
import 'package:go_healthy/utils/shared_preference.dart';



import '../../../../utils/api_exceptions.dart';
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
      final Login login =
          await _loginRepository.login(event.email, event.password);
      await SharedPreference.setAccessToken(login.accessToken);
      emit(LoginSuccessState());
    } catch (error) {
      if (error is APIException) {
        emit(LoginErrorState(message: error.message));
        return;
      }
      log(name: 'LoginBLoC', 'error: $error');
      emit(LoginErrorState());
    }
  }

  // Handles the sign up button event.
  FutureOr<void> _handleLoginNavigateRegisterEvent(
      LoginNavigateRegisterEvent event, Emitter<LoginState> emit) {
    emit(LoginNavigateRegisterActionState());
  }

  // Handles the google login button event.
  Future<void> _handleLoginGoogleButtonPressedEvent(
      LoginGoogleButtonPressedEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoadingState());

      final Login googleUser = await _loginRepository.loginGoogle();

      SharedPreference.setAccessToken(googleUser.accessToken);
      SharedPreference.setRefreshToken(googleUser.refreshToken);

      emit(LoginSuccessState());
    } catch (e) {
      log(name: 'LoginBLoC', 'error: $e');
      emit(LoginErrorState());
    }
  }

  // Handles the forgot password event.
  FutureOr<void> _handleLoginForgotPasswordButtonPressedEvent(
      LoginForgotPasswordButtonPressedEvent event, Emitter<LoginState> emit) {}

  // Handles the show password event.
  FutureOr<void> _handleLoginShowPasswordButtonPressedEvent(
      LoginShowPasswordButtonPressedEvent event, Emitter<LoginState> emit) {
    emit(LoginShowPasswordActionState(obscureText: !event.obscureText));
  }
}
