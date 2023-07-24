import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';

class InputWithLeadingIcon extends StatelessWidget {
  final TextEditingController controller;
  final Widget icon;
  final String hintText;

  const InputWithLeadingIcon({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
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

  const InputWithLeadingAndTrailingIcon({
    super.key,
    required this.controller,
    required this.icon,
    required this.suffixIcon,
    required this.hintText,
    required this.onPressedTrailingIcon,
    this.obscureText = false,
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
      ),
    );
  }
}
