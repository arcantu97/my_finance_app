import 'package:flutter/material.dart';
import 'package:my_expenses/core/ui/widgets/top_bar.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';
import 'package:my_expenses/features/home/presentation/widgets/transaction_list_tile.dart';

import 'package:my_expenses/features/home/presentation/widgets/minimal_bottom_nav.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Transacciones'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search bar
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Buscar',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.textTertiary)),
                  ),
                ],
              ),
            ),
          ),

          // Filters row
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              children: [
                _FilterChip(label: 'Categoría'),
                _FilterChip(label: 'Fecha'),
                _FilterChip(label: 'Monto'),
              ],
            ),
          ),

          // Transactions
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Card(
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  children: const [
                    TransactionListTile(
                      icon: Icons.restaurant,
                      iconBg: AppColors.categoryGrey300,
                      title: 'Cena en El Sabor',
                      category: 'Restaurante',
                      amount: '-\$45.00',
                    ),
                    Divider(),
                    TransactionListTile(
                      icon: Icons.shopping_bag,
                      iconBg: AppColors.categoryGrey400,
                      title: 'Ropa en Boutique Chic',
                      category: 'Compras',
                      amount: '-\$120.00',
                    ),
                    Divider(),
                    TransactionListTile(
                      icon: Icons.local_taxi,
                      iconBg: AppColors.categoryIndigo200,
                      title: 'Viaje en taxi',
                      category: 'Transporte',
                      amount: '-\$15.00',
                    ),
                    Divider(),
                    TransactionListTile(
                      icon: Icons.music_note,
                      iconBg: AppColors.categoryGreen200,
                      title: 'Concierto de música',
                      category: 'Entretenimiento',
                      amount: '-\$60.00',
                    ),
                    Divider(),
                    TransactionListTile(
                      icon: Icons.health_and_safety,
                      iconBg: AppColors.categoryPeach200,
                      title: 'Consulta médica',
                      category: 'Salud',
                      amount: '-\$80.00',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MinimalBottomNav(),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.filter_list),
        label: Text(label),
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
