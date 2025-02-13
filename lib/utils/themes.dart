import 'package:flutter/material.dart';
import 'package:fast_vpn/utils/colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    fontFamily: 'Urbanist',
    scaffoldBackgroundColor: AppColors.lightModeScaffoldBackground,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    fontFamily: 'Urbanist',
  );
}