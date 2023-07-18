import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';

class InputWithLeadingIcon extends StatelessWidget {
  final TextEditingController controller;
  final Widget icon;
  final String hintText;
  final TextStyle hintStyle;

  const InputWithLeadingIcon({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.hintStyle = const TextStyle(color: AppColor.BLACK6),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: icon,
        hintText: hintText,
        suffixIconColor: AppColor.BLACK1,
        iconColor: AppColor.BLACK6,
        hintStyle: hintStyle,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.BLACK5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.BLACK4),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.BLACK5),
        ),
      ),
    );
  }
}

class InputWithLeadingAndTrailingIcon extends StatelessWidget {
  final TextEditingController controller;
  final Widget icon;
  final Widget suffixIcon;
  final String hintText;
  final Function() onPressedTrailingIcon;
  final bool obscureText;
  final TextStyle hintStyle;

  const InputWithLeadingAndTrailingIcon({
    super.key,
    required this.controller,
    required this.icon,
    required this.suffixIcon,
    required this.hintText,
    required this.onPressedTrailingIcon,
    this.obscureText = false,
    this.hintStyle = const TextStyle(color: AppColor.BLACK6),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: suffixIcon,
          onPressed: onPressedTrailingIcon,
        ),
        icon: icon,
        hintText: hintText,
        suffixIconColor: AppColor.BLACK1,
        iconColor: AppColor.BLACK6,
        hintStyle: hintStyle,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.BLACK5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.BLACK4),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.BLACK5),
        ),
      ),
    );
  }
}