
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/constants.dart';

class Input {
  static InputDecoration _buildInputDecoration({
    required Widget? icon,
    required String hintText,
    required Widget? suffixIcon,
    TextStyle? hintStyle,
  }) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      icon: icon,
      hintText: hintText,
      suffixIconColor: AppColor.BLACK1,
      iconColor: AppColor.BLACK6,
      hintStyle: hintStyle ?? const TextStyle(color: AppColor.BLACK6),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.BLACK5),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.BLACK4,
          width: 2.0,
        ),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.BLACK5),
      ),
    );
  }

  static TextField inputWithLeadingIcon({
    required String hintText,
    required Widget icon,
    required TextEditingController controller,
    TextStyle? style = const TextStyle(color: AppColor.BLACK1),
    bool obscureText = false,
    TextStyle? hintStyle,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    
    return TextField(
      obscureText: obscureText,
      controller: controller,
      style: style,
      decoration: _buildInputDecoration(
        icon: icon,
        hintText: hintText,
        suffixIcon: null,
        hintStyle: hintStyle,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }

  static TextField inputWithLeadingAndTrailingIcon({
    required String hintText,
    required Widget icon,
    required Widget suffixIcon,
    required TextEditingController controller,
    TextStyle? style = const TextStyle(color: AppColor.BLACK1),
    bool obscureText = false,
    TextStyle? hintStyle,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {

    return TextField(
      obscureText: obscureText,
      controller: controller,
      style: style,
      decoration: _buildInputDecoration(
        icon: icon,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}