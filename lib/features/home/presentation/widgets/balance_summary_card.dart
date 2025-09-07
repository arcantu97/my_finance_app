import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class BalanceSummaryCard extends StatelessWidget {
  final String label;
  final String amount;

  const BalanceSummaryCard({
    super.key,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark
        ? Theme.of(context).colorScheme.surfaceContainerHighest
        : AppColors.surfaceAlt;
    final titleColor = isDark ? AppColors.white70 : AppColors.textSecondary;
    final amountColor = isDark ? AppColors.white : AppColors.textPrimary;

    return Card(
      color: bg,
      elevation: 0,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: titleColor,
                      fontFamily: GoogleFonts.publicSans().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    amount,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: amountColor,
                      fontFamily: GoogleFonts.publicSans().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
