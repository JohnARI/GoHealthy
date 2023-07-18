import 'package:flutter/material.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';

import '../shared/constants.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(
        horizontal: AppStyle.BUTTON_HORIZONTAL_PADDING,
        vertical: AppStyle.BUTTON_VERTICAL_PADDING),
  });

  final String text;
  final Function onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, context.screenHeight * 0.06),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppColor.BLACK8,
            ),
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
  });

  final String text;
  final Function onPressed;
  final Widget? icon;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon ?? const SizedBox(),
      onPressed: () => onPressed(),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, context.screenHeight * 0.06),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
      ),
      label: Text(text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColor.BLACK2,
              )),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
