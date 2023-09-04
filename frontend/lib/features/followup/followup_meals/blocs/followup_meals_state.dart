part of 'followup_meals_bloc.dart';

abstract class FollowupMealState extends Equatable {
  const FollowupMealState();

  @override
  List<Object> get props => <Object>[];
}

abstract class FollowupMealActionState extends FollowupMealState {}

class FollowupMealInitialState extends FollowupMealState {}

class FollowupMealInitialStateSuccess extends FollowupMealState {
  const FollowupMealInitialStateSuccess();

  @override
  List<Object> get props => <Object>[];
}

class FollowupMealContainerInitialStateSuccess extends FollowupMealState {
  const FollowupMealContainerInitialStateSuccess(
      {required this.title,
      required this.piePrimaryColor,
      required this.pieSecondaryColor,
      required this.svgAssets});
  final String title;
  final Color piePrimaryColor;
  final Color pieSecondaryColor;
  final String svgAssets;

  @override
  List<Object> get props =>
      <Object>[title, piePrimaryColor, pieSecondaryColor, svgAssets];
}

class FollowupMealLoadingState extends FollowupMealState {}

class FollowupMealSuccessState extends FollowupMealActionState {}

class FollowupMealErrorState extends FollowupMealActionState {}

class FollowupMealNavigateSelectMealState extends FollowupMealActionState {
  FollowupMealNavigateSelectMealState({
    required this.mealType,
  });

  final String mealType;
  final int id = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => <Object>[
        mealType,
        id,
      ];
}
