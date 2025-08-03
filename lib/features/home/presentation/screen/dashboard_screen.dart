import 'package:flutter/material.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';
import 'package:my_expenses/core/ui/widgets/card_indicator_widget.dart';
import 'package:my_expenses/core/ui/widgets/card_widget.dart';
import 'package:my_expenses/core/ui/widgets/navigation_bar_widget.dart';
import 'package:my_expenses/features/home/presentation/widgets/dashboard_balance_widget.dart';
import 'package:my_expenses/features/home/presentation/widgets/dashboard_indicators_widget.dart';
import 'package:my_expenses/features/home/presentation/widgets/dashboard_user_bar_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardUserBarWidget.bar(),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          CardWidget(),
          CardIndicatorWidget(),
          DashboardBalanceWidget(),
          DashboardIndicatorsWidget(),
        ],
      ),
      bottomNavigationBar: NavigationBarWidget(),
    );
  }
}
