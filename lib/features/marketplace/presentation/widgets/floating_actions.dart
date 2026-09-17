import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';

class FloatingActions extends StatelessWidget {
  const FloatingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: AppSpacing.md,
      bottom: AppSpacing.md,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: 'support',
            onPressed: () {},
            backgroundColor: Colors.white,
            foregroundColor: AppColors.textPrimary,
            icon: const Icon(Icons.support_agent),
            label: const Text('Support'),
          ),
          const SizedBox(height: AppSpacing.sm),
          FloatingActionButton.extended(
            heroTag: 'coupon',
            onPressed: () {},
            backgroundColor: AppColors.textPrimary,
            foregroundColor: Colors.white,
            icon: const Icon(Icons.local_offer),
            label: const Text('Coupon'),
          ),
        ],
      ),
    );
  }
}
