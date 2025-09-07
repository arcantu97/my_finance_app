import 'package:flutter/material.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    textTheme: Typography.blackMountainView,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryBlue,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
    ),
    dividerColor: AppColors.divider,
    cardColor: AppColors.surface,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: Typography.whiteMountainView,
    colorScheme: ColorScheme.dark(
      primary: AppColors.navigationBarSelectedIconColor,
      surface: AppColors.cardSampleDarkColor,
      onSurface: Colors.white,
    ),
    dividerColor: Colors.white10,
    cardColor: AppColors.cardSampleDarkColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
