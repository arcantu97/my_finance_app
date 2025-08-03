import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class RoundedCardIndicator extends StatelessWidget {
  final bool isPositiveBalance;
  final Widget? widget;

  const RoundedCardIndicator({
    super.key,
    required this.isPositiveBalance,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardSampleDarkColor,
      child: SizedBox(
        width: 156,
        height: 63,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 5.0),
              child: Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isPositiveBalance
                      ? AppColors.positiveActionColor
                      : AppColors.negativeActionColor,
                ),
                child: Center(
                  child: Text(
                    isPositiveBalance
                        ? String.fromCharCode(
                            Icons.arrow_upward_rounded.codePoint,
                          )
                        : String.fromCharCode(
                            Icons.arrow_downward_rounded.codePoint,
                          ),
                    style: TextStyle(
                      inherit: false,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: Icons.arrow_upward.fontFamily,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isPositiveBalance ? 'Entrada' : 'Gastos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: GoogleFonts.publicSans().fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '\$ 1,000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: GoogleFonts.publicSans().fontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
