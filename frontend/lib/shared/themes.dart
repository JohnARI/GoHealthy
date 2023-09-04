import 'package:flutter/material.dart';

import 'colors.dart';
import 'styles.dart';

enum AppTheme {
  LIGHT_THEME,
  DARK_THEME,
}

extension AppThemeExtension on AppTheme {
  // If you want to add more properties to your theme, you can add them here.
  static ThemeData _createThemeData(
      {required ColorScheme colorScheme,
      required Color iconColor,
      required Color textColor}) {
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
      cardColor: colorScheme.onPrimary,
      hintColor: AppColor.BLACK6,
      dividerTheme: const DividerThemeData(
        color: AppColor.BLACK6,
        thickness: 1.0,
      ),
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            colorScheme.primary,
          ),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyle.CARD_RADIUS),
        ),
        color: colorScheme.onPrimary,
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor:
            MaterialStateProperty.all<Color>(colorScheme.onPrimary),
        elevation: MaterialStateProperty.all<double>(0.0),
      
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'fontRegular',
          fontSize: 12.0,
          color: textColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'fontMedium',
          fontSize: 16.0,
          color: textColor,
        ),
        titleSmall: TextStyle(
          fontFamily: 'fontMedium',
          fontSize: 20.0,
          color: textColor,
        ),
        titleMedium: TextStyle(
          fontFamily: 'fontSemiBold',
          fontSize: 24.0,
          color: textColor,
        ),
        titleLarge: TextStyle(
          fontFamily: 'fontBold',
          fontSize: 28.0,
          color: textColor,
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
            onPrimary: Colors.white,
          ),
          textColor: AppColor.BLACK1,
          iconColor: AppColor.BLACK6,
        );
      case AppTheme.DARK_THEME:
        return _createThemeData(
          colorScheme: const ColorScheme.dark(
            primary: AppColor.GREEN4,
            background: AppColor.DARK0,
            onPrimary: AppColor.BLACK1,
          ),
          textColor: AppColor.BLACK6,
          iconColor: AppColor.BLACK6,
        );
      default:
        return _createThemeData(
          colorScheme: const ColorScheme.light(
            primary: AppColor.GREEN4,
            background: AppColor.BLACK8,
            onPrimary: Colors.white,
          ),
          textColor: AppColor.BLACK1,
          iconColor: AppColor.BLACK6,
        );
    }
  }
}
