part of 'logout_bloc.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();
  
  @override
  List<Object> get props => <Object>[];
}

class LogoutInitial extends LogoutState {}
