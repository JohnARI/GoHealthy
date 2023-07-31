import 'package:flutter/material.dart';

import 'package:go_healthy/shared/constants.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final double width;

  const AppCard({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.padding = const EdgeInsets.all(
      AppStyle.CARD_PADDING,
    ),
    this.radius = AppStyle.CARD_RADIUS_SMALL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyle.HORIZONTAL_PADDING,
      ),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: AppColor.WHITE,
        ),
        width: width,
        child: child,
      ),
    );
  }
}
