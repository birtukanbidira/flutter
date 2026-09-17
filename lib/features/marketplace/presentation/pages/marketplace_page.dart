import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../bloc/marketplace_bloc.dart';
import '../bloc/marketplace_event.dart';
import '../bloc/marketplace_state.dart';
import '../widgets/category_navigation.dart';
import '../widgets/cookie_privacy_dialog.dart';
import '../widgets/floating_actions.dart';
import '../widgets/hero_section.dart';
import '../widgets/marketplace_header.dart';
import '../widgets/product_grid.dart';

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MarketplaceBloc, MarketplaceState>(
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1240),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MarketplaceHeader(
                              onSearchChanged: (value) {
                                context
                                    .read<MarketplaceBloc>()
                                    .add(MarketplaceSearchChanged(value));
                              },
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            const HeroSection(),
                            const SizedBox(height: AppSpacing.lg),
                            CategoryNavigation(
                              categories: state.categories,
                              selectedCategory: state.selectedCategory,
                              onSelected: (category) {
                                context
                                    .read<MarketplaceBloc>()
                                    .add(MarketplaceCategorySelected(category));
                              },
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            _buildContent(state),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (state.showCookieDialog)
                  CookiePrivacyDialog(
                    onAccept: () {
                      context
                          .read<MarketplaceBloc>()
                          .add(const MarketplaceCookieAccepted());
                    },
                    onClose: () {
                      context
                          .read<MarketplaceBloc>()
                          .add(const MarketplaceCookieDismissed());
                    },
                  ),
                const FloatingActions(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(MarketplaceState state) {
    switch (state.status) {
      case MarketplaceStatus.initial:
      case MarketplaceStatus.loading:
        return const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
            child: CircularProgressIndicator(color: Colors.white),
          ),
        );
      case MarketplaceStatus.error:
        return Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(state.errorMessage ?? 'Something went wrong.'),
        );
      case MarketplaceStatus.loaded:
        return ProductGrid(products: state.filteredProducts);
    }
  }
}
