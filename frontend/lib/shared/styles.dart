import 'package:flutter/material.dart';

class AppStyle {
  static const double HORIZONTAL_PADDING = 24.0;
  static const double VERTICAL_PADDING = 20.0;
  static const double BUTTON_HORIZONTAL_PADDING = 25.0;
  static const double BUTTON_VERTICAL_PADDING = 15.0;
  static const double TAG_HORIZONTAL_PADDING = BUTTON_HORIZONTAL_PADDING;
  static const double TAG_VERTICAL_PADDING = BUTTON_VERTICAL_PADDING;
  static const double BUTTON_RADIUS = 6.0;
  static const double TAG_RADIUS = 10.0;

  // Shadows
  static BoxShadow shadow0 = BoxShadow(
    color: Colors.black.withOpacity(0.03),
    blurRadius: 15,
    offset: const Offset(0, 0),
  );
}
