import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileInitialEvent>(_handleProfileInitialEvent);
  }

  FutureOr<void> _handleProfileInitialEvent(ProfileInitialEvent event, Emitter<ProfileState> emit) {
  }
}
