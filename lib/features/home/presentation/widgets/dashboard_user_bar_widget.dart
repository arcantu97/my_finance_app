import 'package:flutter/material.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class DashboardUserBarWidget {
  static PreferredSizeWidget bar() {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(
              Icons.account_circle_rounded,
              size: 50,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buenas noches,',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              const Text(
                'José Cantú',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          onPressed: () {
            // Action for settings button
          },
        ),
      ],
    );
  }
}
