part of 'pie_chart_bloc.dart';

abstract class PieChartEvent extends Equatable {
  const PieChartEvent();

  @override
  List<Object> get props => <Object>[];
}

class PieChartInitialEvent extends PieChartEvent {
  const PieChartInitialEvent(
      {required this.minValue, required this.maxValue, required this.type});

  final double minValue;
  final double maxValue;
  final PieChartType type;

  @override
  List<Object> get props => <Object>[minValue, maxValue, type];
}

class PieChartContainerInitialEvent extends PieChartEvent {
  const PieChartContainerInitialEvent({required this.type});

  final PieChartType type;

  @override
  List<Object> get props => <Object>[type];
}

class PieChartButtonPressedEvent extends PieChartEvent {
  const PieChartButtonPressedEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => <Object>[email, password];
}

class PieChartForgotPasswordButtonPressedEvent extends PieChartEvent {}

class PieChartGoogleButtonPressedEvent extends PieChartEvent {
  @override
  List<Object> get props => <Object>[];
}

class PieChartShowPasswordButtonPressedEvent extends PieChartEvent {}

class PieChartNavigateRegisterEvent extends PieChartEvent {}

class PieChartNavigateForgotPasswordEvent extends PieChartEvent {}

class PieChartNavigateGoogleEvent extends PieChartEvent {}
