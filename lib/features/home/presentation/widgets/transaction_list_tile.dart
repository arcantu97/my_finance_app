import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class TransactionListTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String category;
  final String amount;

  const TransactionListTile({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.category,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDark ? AppColors.white : AppColors.textPrimary;
    final subtitleColor = isDark ? AppColors.white70 : AppColors.textSecondary;
    return Row(
      children: [
        Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: titleColor,
                  fontFamily: GoogleFonts.publicSans().fontFamily,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                category,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: subtitleColor,
                  fontFamily: GoogleFonts.publicSans().fontFamily,
                ),
              ),
            ],
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: amount.startsWith('-')
                ? titleColor
                : AppColors.positiveActionColor,
            fontFamily: GoogleFonts.publicSans().fontFamily,
          ),
        ),
      ],
    );
  }
}
