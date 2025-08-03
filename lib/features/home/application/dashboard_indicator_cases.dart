import 'package:flutter/material.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

enum DashboardCardIndicatorType {
  goals(
    cardIndicator: AppColors.statiticsGoalColor,
    title: 'Metas',
    icon: Icons.flag_sharp,
    indicatorValue: 0,
  ),
  expense(
    cardIndicator: AppColors.statiticsExpenseColor,
    title: 'Gastos',
    icon: Icons.credit_card_sharp,
    indicatorValue: 0,
  ),
  savings(
    cardIndicator: AppColors.statiticsSavingColor,
    title: 'Ahorros',
    icon: Icons.savings,
    indicatorValue: 0,
  ),
  transactions(
    cardIndicator: AppColors.statiticsTransactionsColor,
    title: 'Transacciones',
    icon: Icons.swap_horiz,
    indicatorValue: 0,
  );

  final Color cardIndicator;
  final String title;
  final IconData icon;
  final int indicatorValue;

  const DashboardCardIndicatorType({
    this.cardIndicator = Colors.blue,
    this.title = 'Default',
    this.icon = Icons.info,
    this.indicatorValue = 0,
  });
}
