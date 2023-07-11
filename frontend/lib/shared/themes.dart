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
      brightness: brightness,
      primaryColor: primaryColor,
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'fontRegular',
          fontSize: 12.0,
          color: AppColor.BLACK1,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'fontMedium',
          fontSize: 16.0,
          color: AppColor.BLACK1,
        ),
        titleSmall: TextStyle(
          fontFamily: 'fontMedium',
          fontSize: 20.0,
          color: AppColor.BLACK1,
        ),
        titleMedium: TextStyle(
          fontFamily: 'fontSemiBold',
          fontSize: 24.0,
          color: AppColor.BLACK1,
        ),
        titleLarge: TextStyle(
          fontFamily: 'fontBold',
          fontSize: 28.0,
          color: AppColor.BLACK1,
        ),
      ),
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
