import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_expenses/core/ui/widgets/top_bar.dart';

class NewCardScreen extends StatelessWidget {
  const NewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Añadir nueva tarjeta'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Progress dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Dot(active: true),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: _Dot(active: false),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: _Dot(active: false),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text('Ingresa los datos de tu tarjeta',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w800)),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: _Field(label: 'Número de tarjeta'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: _Field(label: 'Fecha de vencimiento'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: _Field(label: 'Código de seguridad (CVV)'),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: () => context.go('/cards/confirmation'),
              child: const Text('Continuar'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  const _Field({required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool active;
  const _Dot({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color:
            active ? Theme.of(context).colorScheme.primary : Colors.grey[400],
        shape: BoxShape.circle,
      ),
    );
  }
}

