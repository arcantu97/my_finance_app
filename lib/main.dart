import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_expenses/core/providers/theme_provider.dart';
import 'package:my_expenses/core/router/app_router.dart';
import 'package:my_expenses/core/ui/resources/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final mode = ref.watch(themeModeProvider);
    final light = ref.watch(lightThemeProvider);
    final dark = ref.watch(darkThemeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: light,
      darkTheme: dark,
      themeMode: mode,
    );
  }
}
