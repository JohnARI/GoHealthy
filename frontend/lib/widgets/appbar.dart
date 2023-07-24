import 'package:flutter/material.dart';

class AppBarGeneral extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGeneral({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Size get preferredSize => const Size.fromHeight(10);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(name, style: Theme.of(context).textTheme.titleLarge),
      ),
      centerTitle: false,
    );
  }
}
