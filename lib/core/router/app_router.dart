import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_expenses/features/cards/presentation/screen/card_confirmation_screen.dart';
import 'package:my_expenses/features/cards/presentation/screen/cards_screen.dart';
import 'package:my_expenses/features/cards/presentation/screen/new_card_screen.dart';
import 'package:my_expenses/features/home/presentation/screen/dashboard_screen.dart';
import 'package:my_expenses/features/settings/presentation/screen/settings_screen.dart';
import 'package:my_expenses/features/subscription/presentation/screen/subscription_detail_screen.dart';
import 'package:my_expenses/features/transactions/presentation/screen/transactions_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: DashboardScreen(),
        ),
      ),
      GoRoute(
        path: '/transactions',
        name: 'transactions',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TransactionsScreen(),
        ),
      ),
      GoRoute(
        path: '/cards',
        name: 'cards',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CardsScreen(),
        ),
        routes: [
          GoRoute(
            path: 'new',
            name: 'new-card',
            builder: (context, state) => const NewCardScreen(),
          ),
          GoRoute(
            path: 'confirmation',
            name: 'card-confirmation',
            builder: (context, state) => const CardConfirmationScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/subscription',
        name: 'subscription',
        builder: (context, state) => const SubscriptionDetailScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SettingsScreen(),
        ),
      ),
    ],
  );
});
