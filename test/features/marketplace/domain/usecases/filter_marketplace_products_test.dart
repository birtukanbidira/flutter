import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_marketplace/features/marketplace/domain/entities/product.dart';
import 'package:flutter_marketplace/features/marketplace/domain/usecases/filter_marketplace_products.dart';

void main() {
  const products = [
    Product(
      id: '1',
      brand: 'STREAMX',
      title: 'Movie Stream Family',
      price: '6.49',
      billingPeriod: '/month',
      featureSummary: 'Family streaming access with HD playback.',
      category: 'SVOD',
      buttonLabel: 'Get offer',
    ),
    Product(
      id: '2',
      brand: 'AI+',
      title: 'Chat Assistant Pro',
      price: '4.99',
      billingPeriod: '/month',
      featureSummary: 'Premium AI prompts and workflow packs.',
      category: 'AI',
      buttonLabel: 'Subscribe now',
    ),
  ];

  const useCase = FilterMarketplaceProducts();

  test('filters by selected category', () {
    final result = useCase(
      products: products,
      selectedCategory: 'AI',
      searchQuery: '',
    );

    expect(result, hasLength(1));
    expect(result.first.title, 'Chat Assistant Pro');
  });

  test('filters by search query across product text', () {
    final result = useCase(
      products: products,
      selectedCategory: 'All',
      searchQuery: 'streaming',
    );

    expect(result, hasLength(1));
    expect(result.first.brand, 'STREAMX');
  });
}
