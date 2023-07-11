import 'package:flutter/material.dart';

import 'colors.dart';

enum AppTheme {
  LIGHT_THEME,
  DARK_THEME,
}

extension AppThemeExtension on AppTheme {
  // If you want to add more properties to your theme, you can add them here.
  static ThemeData _createThemeData(Brightness brightness, Color primaryColor) {
    return ThemeData(
      fontFamily: 'NunitoSans',
      brightness: brightness,
      primaryColor: primaryColor,
      useMaterial3: true,
    );
  }

  ThemeData get themeData {
    switch (this) {
      case AppTheme.LIGHT_THEME:
        return _createThemeData(Brightness.light, AppColor.TEAL0);
      case AppTheme.DARK_THEME:
        return _createThemeData(Brightness.dark, AppColor.TEAL0);
      default:
        return _createThemeData(Brightness.light, AppColor.TEAL0);
    }
  }
}
