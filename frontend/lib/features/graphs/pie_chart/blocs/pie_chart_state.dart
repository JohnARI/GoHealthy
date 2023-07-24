part of 'pie_chart_bloc.dart';

abstract class PieChartState extends Equatable {
  const PieChartState();

  @override
  List<Object> get props => <Object>[];
}

abstract class PieChartActionState extends PieChartState {}

class PieChartInitialState extends PieChartState {}

class PieChartInitialStateSuccess extends PieChartState {
  const PieChartInitialStateSuccess(
      {required this.percentValueFilled, required this.percentValueUnfilled});
  final double percentValueFilled;
  final double percentValueUnfilled;

  @override
  List<Object> get props => <Object>[percentValueFilled, percentValueUnfilled];
}

class PieChartLoadingState extends PieChartState {}

class PieChartSuccessState extends PieChartActionState {}

class PieChartErrorState extends PieChartActionState {}

class PieChartShowPasswordActionState extends PieChartActionState {}

class PieChartNavigateRegisterActionState extends PieChartActionState {}

class PieChartNavigateForgotPasswordActionState extends PieChartActionState {}

class PieChartNavigateGoogleActionState extends PieChartActionState {}
