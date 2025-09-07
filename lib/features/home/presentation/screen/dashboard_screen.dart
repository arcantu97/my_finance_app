import 'package:flutter/material.dart';
import 'package:my_expenses/core/ui/widgets/top_bar.dart';
import 'package:my_expenses/features/home/presentation/widgets/amount_stat_card.dart';
import 'package:my_expenses/features/home/presentation/widgets/balance_summary_card.dart';
import 'package:my_expenses/features/home/presentation/widgets/payment_list_tile.dart';
import 'package:my_expenses/features/home/presentation/widgets/primary_chip_button.dart';
import 'package:my_expenses/features/home/presentation/widgets/section_title.dart';
import 'package:my_expenses/features/home/presentation/widgets/transaction_list_tile.dart';
import 'package:my_expenses/features/home/presentation/widgets/view_more_button.dart';
import 'package:my_expenses/features/home/presentation/widgets/minimal_bottom_nav.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(
        showGreeting: true,
        userName: 'José Cantú',
        avatarAsset: 'assets/logo.png',
        notifications: 3,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Balance Card
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SizedBox(
                  height: 90,
                  width: double.infinity,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: BalanceSummaryCard(
                      key: const ValueKey('balance-card'),
                      label: 'Total Balance',
                      amount: '\$1,234.56',
                    ),
                  ),
                ),
              ),

              // Income / Expenses cards
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: AmountStatCard(
                        title: 'Income',
                        amount: '\$2,500.00',
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: AmountStatCard(
                          title: 'Expenses',
                          amount: '\$1,265.44',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Action buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: const [
                    PrimaryChipButton(label: 'Add Expense'),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: PrimaryChipButton(
                        label: 'Bills',
                        style: ChipButtonStyle.secondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Upcoming Payments
              const SectionTitle('Upcoming Payments'),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      children: [
                        const PaymentListTile(
                          icon: Icons.credit_card,
                          iconBg: AppColors.categoryOrange,
                          title: 'Credit Card',
                          subtitle: 'Payment Due: Oct 20',
                          amount: '\$150.00',
                        ),
                        const Divider(),
                        const PaymentListTile(
                          icon: Icons.account_balance,
                          iconBg: AppColors.categoryBlueGrey,
                          title: 'Loan',
                          subtitle: 'Payment Due: Nov 5',
                          amount: '\$300.00',
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Recent Transactions
              const SectionTitle('Recent Transactions'),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      children: [
                        const TransactionListTile(
                          icon: Icons.shopping_cart,
                          iconBg: AppColors.categoryGrey300,
                          title: 'Supermarket',
                          category: 'Groceries',
                          amount: '-\$50.00',
                        ),
                        const Divider(),
                        const TransactionListTile(
                          icon: Icons.local_movies,
                          iconBg: AppColors.categoryGrey400,
                          title: 'Cinema',
                          category: 'Entertainment',
                          amount: '-\$20.00',
                        ),
                        const Divider(),
                        const TransactionListTile(
                          icon: Icons.directions_bus,
                          iconBg: AppColors.categoryIndigo200,
                          title: 'Bus Ticket',
                          category: 'Transportation',
                          amount: '-\$2.50',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ViewMoreButton(onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MinimalBottomNav(),
    );
  }
}
