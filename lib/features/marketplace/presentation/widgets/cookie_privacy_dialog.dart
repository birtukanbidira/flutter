import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';

class CookiePrivacyDialog extends StatelessWidget {
  const CookiePrivacyDialog({
    super.key,
    required this.onClose,
    required this.onAccept,
  });

  final VoidCallback onClose;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: AppSpacing.md,
      bottom: 90,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFFFD3A2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cookie & Privacy',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    onPressed: onClose,
                    icon: const Icon(Icons.close, size: 18),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              const Text(
                'We use cookies to improve your marketplace browsing experience.',
                style: TextStyle(color: AppColors.textPrimary),
              ),
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: onAccept,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.textPrimary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Accept recommended settings'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
