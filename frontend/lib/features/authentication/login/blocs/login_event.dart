part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoginInitialEvent extends LoginEvent {}

class LoginButtonPressedEvent extends LoginEvent {
  const LoginButtonPressedEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => <Object>[email, password];
}


class LoginForgotPasswordButtonPressedEvent extends LoginEvent {}

class LoginGoogleButtonPressedEvent extends LoginEvent {}

class LoginShowPasswordButtonPressedEvent extends LoginEvent {}

class LoginNavigateRegisterEvent extends LoginEvent {}

class LoginNavigateForgotPasswordEvent extends LoginEvent {}

class LoginNavigateGoogleEvent extends LoginEvent {}
