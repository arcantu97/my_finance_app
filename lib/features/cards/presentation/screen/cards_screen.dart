import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_expenses/core/ui/widgets/top_bar.dart';
import 'package:my_expenses/features/home/presentation/widgets/minimal_bottom_nav.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Tarjetas'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Mis tarjetas',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w800)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              children: const [
                _CardRow(brand: 'Mastercard', ending: '4242'),
                Divider(),
                _CardRow(brand: 'Visa', ending: '1234'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text('Añadir tarjeta',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w800)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                _AddOption(
                  label: 'Tarjeta de crédito',
                  onTap: () => context.go('/cards/new'),
                ),
                _AddOption(
                  label: 'Tarjeta de débito',
                  onTap: () => context.go('/cards/new'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MinimalBottomNav(),
    );
  }
}

class _CardRow extends StatelessWidget {
  final String brand;
  final String ending;
  const _CardRow({required this.brand, required this.ending});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.credit_card),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tarjeta de crédito',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700)),
                Text('Termina en $ending',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AddOption extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _AddOption({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.add_card),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(label,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
