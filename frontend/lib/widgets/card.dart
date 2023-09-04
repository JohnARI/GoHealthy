import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: child,
    );
  }
}
