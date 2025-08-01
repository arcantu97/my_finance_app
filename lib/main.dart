import 'package:flutter/material.dart';
import 'package:my_expenses/core/ui/resources/app_theme.dart';
import 'package:my_expenses/features/home/presentation/screen/dashboard_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
      theme: AppTheme.baseTheme,
    );
  }
}
