part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => <Object>[];
}

abstract class LoginActionState extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginActionState {}

class LoginErrorState extends LoginActionState {}

class LoginShowPasswordActionState extends LoginActionState {}

class LoginNavigateRegisterActionState extends LoginActionState {}

class LoginNavigateForgotPasswordActionState extends LoginActionState {}

class LoginNavigateGoogleActionState extends LoginActionState {}

