import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class DashboardCardIndicator extends StatelessWidget {
  final Color cardIndicator;
  final String title;
  final IconData icon;
  final int indicatorValue;

  const DashboardCardIndicator({
    super.key,
    required this.cardIndicator,
    required this.title,
    required this.icon,
    required this.indicatorValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent, width: 1.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
        width: 156,
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cardIndicator,
                    ),
                    child: Center(child: Icon(icon)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: GoogleFonts.publicSans().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Text(
                  indicatorValue.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: GoogleFonts.publicSans().fontFamily,
                    fontWeight: FontWeight.w700,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
