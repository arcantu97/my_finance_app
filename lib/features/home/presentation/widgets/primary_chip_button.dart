import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

enum ChipButtonStyle { primary, secondary }

class PrimaryChipButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ChipButtonStyle style;

  const PrimaryChipButton({
    super.key,
    required this.label,
    this.onPressed,
    this.style = ChipButtonStyle.primary,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = style == ChipButtonStyle.primary;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color bg = isPrimary
        ? Theme.of(context).colorScheme.primary
        : (isDark ? Theme.of(context).colorScheme.surface : AppColors.chipGray);
    final Color fg = isPrimary
        ? AppColors.white
        : (isDark ? AppColors.white : AppColors.textPrimary);

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: bg,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: fg,
          fontFamily: GoogleFonts.publicSans().fontFamily,
        ),
      ),
    );
  }
}
