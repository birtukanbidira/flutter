import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/product.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        int crossAxisCount = 1;
        if (width >= AppBreakpoints.desktop) {
          crossAxisCount = 4;
        } else if (width >= AppBreakpoints.tablet) {
          crossAxisCount = 3;
        } else if (width >= AppBreakpoints.mobile) {
          crossAxisCount = 2;
        }

        if (products.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'No products found. Try another category or search term.',
              textAlign: TextAlign.center,
            ),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: width >= AppBreakpoints.tablet ? 0.86 : 0.84,
          ),
          itemBuilder: (context, index) => ProductCard(product: products[index]),
        );
      },
    );
  }
}
