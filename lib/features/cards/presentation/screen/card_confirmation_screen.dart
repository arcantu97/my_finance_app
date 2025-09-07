import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_expenses/core/ui/widgets/top_bar.dart';

class CardConfirmationScreen extends StatelessWidget {
  const CardConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Añadir tarjeta'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text('¡Tarjeta añadida!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w800)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Tu tarjeta ha sido añadida con éxito. Los últimos cuatro dígitos son 4567.',
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.go('/cards'),
              child: const Text('Hecho'),
            ),
          ],
        ),
      ),
    );
  }
}

