import 'package:flutter/material.dart';
import 'package:fast_vpn/utils/colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    fontFamily: 'Urbanist',
    scaffoldBackgroundColor: AppColors.lightModeScaffoldBackground,
    canvasColor: Colors.black,
    cardColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white,
    )
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    fontFamily: 'Urbanist',
    scaffoldBackgroundColor: AppColors.darkModeScaffoldBackground,
    canvasColor: Colors.white,
    cardColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white.withOpacity(.1),
    )
  );
}