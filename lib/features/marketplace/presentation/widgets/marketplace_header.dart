import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';

class MarketplaceHeader extends StatelessWidget {
  const MarketplaceHeader({
    super.key,
    required this.onSearchChanged,
  });

  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < AppBreakpoints.tablet;
        if (isMobile) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _BrandAndAction(onSearchChanged: onSearchChanged, isMobile: true),
              const SizedBox(height: AppSpacing.sm),
              const Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  _NavItem(label: 'Subscription'),
                  _NavItem(label: 'Game'),
                  _NavItem(label: 'Support'),
                  _LocalePill(),
                  _LoginButton(),
                ],
              ),
            ],
          );
        }

        return Row(
          children: [
            const _BrandPill(),
            const SizedBox(width: AppSpacing.lg),
            const _NavItem(label: 'Subscription'),
            const SizedBox(width: AppSpacing.md),
            const _NavItem(label: 'Game'),
            const SizedBox(width: AppSpacing.md),
            const _NavItem(label: 'Support'),
            const SizedBox(width: AppSpacing.lg),
            Expanded(child: _SearchField(onSearchChanged: onSearchChanged)),
            const SizedBox(width: AppSpacing.md),
            const _LocalePill(),
            const SizedBox(width: AppSpacing.md),
            const _LoginButton(),
          ],
        );
      },
    );
  }
}

class _BrandAndAction extends StatelessWidget {
  const _BrandAndAction({required this.onSearchChanged, required this.isMobile});

  final ValueChanged<String> onSearchChanged;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _BrandPill(),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: _SearchField(onSearchChanged: onSearchChanged)),
        if (!isMobile) const SizedBox(width: AppSpacing.sm),
        if (!isMobile) const _LoginButton(),
      ],
    );
  }
}

class _BrandPill extends StatelessWidget {
  const _BrandPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: AppColors.background,
            child: Icon(Icons.storefront, size: 12, color: Colors.white),
          ),
          SizedBox(width: AppSpacing.xs),
          Text(
            'BrandName',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.onSearchChanged});

  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearchChanged,
      decoration: InputDecoration(
        hintText: 'Search products',
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _LocalePill extends StatelessWidget {
  const _LocalePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text('EN/USD', style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
      ),
      onPressed: () {},
      child: const Text('Login / Sign up'),
    );
  }
}
