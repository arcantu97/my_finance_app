import 'package:flutter/material.dart';
import 'package:my_expenses/core/ui/widgets/rounded_card_indicator.dart';

class DashboardBalanceWidget extends StatelessWidget {
  const DashboardBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: RoundedCardIndicator(isPositiveBalance: true),
          ),
          RoundedCardIndicator(isPositiveBalance: false),
        ],
      ),
    );
  }
}
