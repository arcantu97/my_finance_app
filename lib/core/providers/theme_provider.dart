import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_expenses/core/ui/resources/app_theme.dart';

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system;

  void toggle() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  void setMode(ThemeMode mode) => state = mode;
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

// Prebuild theme data so main.dart stays lean and avoids rebuilding fonts.
final lightThemeProvider = Provider<ThemeData>((ref) {
  return AppTheme.lightTheme.copyWith(
    textTheme: GoogleFonts.publicSansTextTheme(AppTheme.lightTheme.textTheme),
  );
});

final darkThemeProvider = Provider<ThemeData>((ref) {
  return AppTheme.darkTheme.copyWith(
    textTheme: GoogleFonts.publicSansTextTheme(AppTheme.darkTheme.textTheme),
  );
});
