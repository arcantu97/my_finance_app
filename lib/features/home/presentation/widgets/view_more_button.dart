import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class ViewMoreButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const ViewMoreButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor:
            isDark ? Theme.of(context).colorScheme.surface : AppColors.chipGray,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        'View More',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: isDark ? AppColors.white : AppColors.textPrimary,
          fontFamily: GoogleFonts.publicSans().fontFamily,
        ),
      ),
    );
  }
}
