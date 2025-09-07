import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_expenses/core/providers/theme_provider.dart';
import 'package:my_expenses/core/ui/widgets/top_bar.dart';
import 'package:my_expenses/features/home/presentation/widgets/minimal_bottom_nav.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: const TopBar(title: 'Configuración'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            value: mode == ThemeMode.dark,
            onChanged: (_) => ref.read(themeModeProvider.notifier).toggle(),
            title: const Text('Modo oscuro'),
          ),
        ],
      ),
      bottomNavigationBar: const MinimalBottomNav(),
    );
  }
}
