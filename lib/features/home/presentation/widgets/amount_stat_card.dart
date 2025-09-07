import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class AmountStatCard extends StatelessWidget {
  final String title;
  final String amount;

  const AmountStatCard({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark
        ? Theme.of(context).colorScheme.surface
        : AppColors.surface;
    final titleColor = isDark ? AppColors.white70 : AppColors.textSecondary;
    final amountColor = isDark ? AppColors.white : AppColors.textPrimary;

    return Card(
      color: bg,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: titleColor,
                fontFamily: GoogleFonts.publicSans().fontFamily,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              amount,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: amountColor,
                fontFamily: GoogleFonts.publicSans().fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
