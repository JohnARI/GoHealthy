import 'package:flutter/material.dart';

import 'colors.dart';
import 'styles.dart';

enum AppTheme {
  LIGHT_THEME,
  DARK_THEME,
}

extension AppThemeExtension on AppTheme {
  // If you want to add more properties to your theme, you can add them here.
  static ThemeData _createThemeData({required ColorScheme colorScheme}) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.BLACK5),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.BLACK5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.BLACK4),
        ),
        hintStyle: TextStyle(
          color: AppColor.BLACK6,
          fontFamily: 'fontRegular',
          fontSize: 20.0,
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.background,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          backgroundColor: MaterialStateProperty.all<Color>(
            colorScheme.primary,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppStyle.BUTTON_RADIUS),
            ),
          ),
        ),
      ),
      hintColor: AppColor.BLACK6,
      dividerTheme: const DividerThemeData(
        color: AppColor.BLACK6,
        thickness: 1.0,
      ),
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
        return _createThemeData(
            colorScheme: const ColorScheme.light(
          primary: AppColor.GREEN4,
          background: AppColor.BLACK8,
          brightness: Brightness.light,
        ));
      case AppTheme.DARK_THEME:
        return _createThemeData(
            colorScheme: const ColorScheme.dark(
          primary: AppColor.GREEN4,
          background: AppColor.BLACK1,
          brightness: Brightness.dark,
        ));
      default:
        return _createThemeData(
            colorScheme: const ColorScheme.light(
          primary: AppColor.GREEN4,
          background: AppColor.BLACK8,
          brightness: Brightness.light,
        ));
    }
  }
}
