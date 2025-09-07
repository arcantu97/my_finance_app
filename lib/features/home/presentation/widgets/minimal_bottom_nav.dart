import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class MinimalBottomNav extends StatelessWidget {
  const MinimalBottomNav({super.key});

  int _indexForLocation(String location) {
    if (location.startsWith('/transactions')) return 1;
    if (location.startsWith('/cards')) return 2;
    if (location.startsWith('/settings')) return 3;
    return 0; // home
  }

  String _pathForIndex(int index) {
    switch (index) {
      case 1:
        return '/transactions';
      case 2:
        return '/cards';
      case 3:
        return '/settings';
      default:
        return '/';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bg = isDark ? theme.colorScheme.surface : AppColors.surface;
    final inactive = isDark ? AppColors.white70 : AppColors.textTertiary;
    final active = theme.colorScheme.primary;

    final uriString = GoRouterState.of(context).uri.toString();
    final currentIndex = _indexForLocation(uriString);

    Widget item(IconData icon, int i) {
      final selected = currentIndex == i;
      return Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => context.go(_pathForIndex(i)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            constraints: const BoxConstraints(minHeight: 44),
            decoration: BoxDecoration(
              color: selected
                  ? active.withValues(alpha: 0.12)
                  : AppColors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(icon, size: 24, color: selected ? active : inactive),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isDark
              ? []
              : [
                  const BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 20,
                    offset: Offset(0, 4),
                  )
                ],
        ),
        child: Row(
          children: [
            item(Icons.home_filled, 0),
            item(Icons.list_alt_rounded, 1),
            item(Icons.credit_card, 2),
            item(Icons.settings, 3),
          ],
        ),
      ),
    );
  }
}
