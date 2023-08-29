import 'package:flutter/material.dart';

import '../shared/constants.dart';

class AppBarGeneral extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGeneral({Key? key, required this.name}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[AppStyle.shadow0],
      ),
      child: AppBar(
        scrolledUnderElevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(name, style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
    );
  }
}
