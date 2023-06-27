part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => <Object>[];
}


class RegisterInitialEvent extends RegisterEvent {}

class RegisterButtonPressedEvent extends RegisterEvent {
  const RegisterButtonPressedEvent(this.email, this.password, this.name);

  final String email;
  final String password;
  final String name;

  @override
  List<Object> get props => <Object>[email, password, name];
}

class RegisterNavigateLoginEvent extends RegisterEvent {}

