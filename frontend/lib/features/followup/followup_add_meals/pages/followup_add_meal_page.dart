import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/followup_add_meal_bloc.dart';

class FollowupAddMealPage extends StatelessWidget {
  const FollowupAddMealPage({super.key, required this.mealType});
  final String mealType;

  @override
  Widget build(BuildContext context) {
    final FollowupAddMealBloc followupAddMealsBloc = FollowupAddMealBloc();
    return BlocConsumer<FollowupAddMealBloc, FollowupAddMealState>(
      listener: (BuildContext context, FollowupAddMealState state) {
        // TODO: implement listener
      },
      bloc: followupAddMealsBloc,
      builder: (BuildContext context, FollowupAddMealState state) {
        if (state is FollowupAddMealsInitialState) {
          return _buildInitialState(context);
        }
        return _buildInitialState(context);
      },
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return Container(
      child: Text(mealType),
    );
  }
}
