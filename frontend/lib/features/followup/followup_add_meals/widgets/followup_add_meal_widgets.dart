import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_healthy/widgets/card.dart';

class MealListWidget extends StatelessWidget {
  const MealListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: ListTile(
        leading: SvgPicture.asset(
          'assets/images/Breakfast.svg',
          width: 50,
          height: 50,
        ),
        title: const Text(
          'Spaghettis au pesto de roquette et noix et no...',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: const Text('Calories: 374.05kcal / 100g'),
        trailing: Icon(
          Icons.add_circle,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
