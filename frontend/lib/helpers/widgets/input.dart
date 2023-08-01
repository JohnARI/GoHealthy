import 'package:flutter/services.dart';

class RangeTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  RangeTextInputFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int? parsedValue = int.tryParse(newValue.text);
    final int? clampedValue = parsedValue?.clamp(min, max);

    if (clampedValue != parsedValue) {
      final String newString = clampedValue.toString();
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length),
      );
    }

    return newValue;
  }
}
