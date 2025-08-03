import 'package:flutter/material.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class AppTheme {
  static ThemeData baseTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
