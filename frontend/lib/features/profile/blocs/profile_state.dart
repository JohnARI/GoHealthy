part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => <Object>[];
}

class ProfileInitialState extends ProfileState {}
