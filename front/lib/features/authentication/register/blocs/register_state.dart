part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => <Object>[];
}

abstract class RegisterActionState extends RegisterState {}

class RegisterInitialState extends RegisterState {}
