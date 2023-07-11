import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input {
  static TextFormField inputWithLeadingIcon({
    required String hintText,
    required Widget icon,
    required TextEditingController controller,
    bool obscureText = false,
    TextStyle? labelStyle,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: icon,
        hintText: hintText,
        labelStyle: labelStyle,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  static TextFormField inputWithLeadingAndTrailingIcon({
    required String hintText,
    required Widget icon,
    required Widget suffixIcon,
    required TextEditingController controller,
    bool obscureText = false,
    TextStyle? labelStyle,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        icon: icon,
        hintText: hintText,
        labelStyle: labelStyle,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
