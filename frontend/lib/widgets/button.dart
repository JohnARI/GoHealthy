import 'package:flutter/material.dart';

import '../shared/constants.dart';

class Button {
  final double horizontalButtonPadding = AppStyle.HORIZONTAL_PADDING;
  final double verticalButtonPadding = AppStyle.BUTTON_VERTICAL_PADDING;
  static ElevatedButton filledButton(
      {required String text,
      required Function onPressed,
      EdgeInsetsGeometry padding =
          const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0)}) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
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

  static ElevatedButton outlinedButton(
      {required String text,
      required Function onPressed,
      EdgeInsetsGeometry padding =
          const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0)}) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
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
      child: Text(text),
    );
  }

  static TextButton textButton({
    required String text,
    required Function onPressed,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
    TextStyle textStyle = const TextStyle(color: Colors.green),
  }) {
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
