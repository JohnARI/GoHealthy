part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

abstract class LoginActionState extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginActionState {}

class LoginErrorState extends LoginActionState {}

class LoginShowPasswordActionState extends LoginActionState {
  final bool obscureText;

  LoginShowPasswordActionState({required this.obscureText});

  @override
  List<Object> get props => <Object>[obscureText];
}

class LoginNavigateRegisterActionState extends LoginActionState {}

class LoginNavigateForgotPasswordActionState extends LoginActionState {}

class LoginNavigateGoogleActionState extends LoginActionState {}