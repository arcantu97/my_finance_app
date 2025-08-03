import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_expenses/features/home/application/dashboard_indicator_cases.dart';
import 'package:my_expenses/features/home/presentation/widgets/dashboard_card_indicator.dart';

class DashboardIndicatorsWidget extends StatelessWidget {
  const DashboardIndicatorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardCards = [
      DashboardCardIndicatorType.goals,
      DashboardCardIndicatorType.expense,
      DashboardCardIndicatorType.savings,
      DashboardCardIndicatorType.transactions,
    ];

    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 40.0,
                bottom: 15.0,
              ),
              child: Text(
                'Indicadores',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: GoogleFonts.publicSans().fontFamily,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.0,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 15.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dashboardCards
                    .length, // Número de elementos en la cuadrícula
                itemBuilder: (context, index) {
                  return DashboardCardIndicator(
                    cardIndicator: dashboardCards[index].cardIndicator,
                    title: dashboardCards[index].title,
                    icon: dashboardCards[index].icon,
                    indicatorValue: dashboardCards[index].indicatorValue,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
