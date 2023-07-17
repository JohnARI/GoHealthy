import 'package:flutter/material.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';

import '../shared/constants.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.context,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
  });

  final BuildContext context;
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
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyle.BUTTON_RADIUS),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.context,
    required this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
  });

  final String text;
  final Function onPressed;
  final BuildContext context;
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
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            color: Colors.green,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyle.BUTTON_RADIUS),
            side: const BorderSide(
              color: Colors.green,
            ),
          ),
        ),
      ),
      label: Text(text),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
    required this.textStyle,
  });

  final String text;
  final Function onPressed;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
        textStyle: MaterialStateProperty.all<TextStyle>(textStyle),
      ),
      child: Text(text),
    );
  }
}
