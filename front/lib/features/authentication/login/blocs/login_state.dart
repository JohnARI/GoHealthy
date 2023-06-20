part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => <Object>[];
}

abstract class LoginActionState extends LoginState {}

class LoginInitialState extends LoginState {}