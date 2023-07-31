import 'package:flutter/material.dart';
import 'package:go_healthy/shared/styles.dart';

class AppBarGeneral extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGeneral({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Size get preferredSize => const Size.fromHeight(10);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[AppStyle.shadow0],
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(name, style: Theme.of(context).textTheme.titleLarge),
        ),
        centerTitle: false,
      ),
    );
  }
}
