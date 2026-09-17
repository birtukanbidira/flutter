import '../entities/product.dart';

class FilterMarketplaceProducts {
  const FilterMarketplaceProducts();

  List<Product> call({
    required List<Product> products,
    required String selectedCategory,
    required String searchQuery,
  }) {
    final normalizedQuery = searchQuery.trim().toLowerCase();
    return products.where((product) {
      final matchesCategory = selectedCategory == 'All' ||
          product.category.toLowerCase() == selectedCategory.toLowerCase();
      final matchesSearch = normalizedQuery.isEmpty ||
          product.title.toLowerCase().contains(normalizedQuery) ||
          product.brand.toLowerCase().contains(normalizedQuery) ||
          product.featureSummary.toLowerCase().contains(normalizedQuery);
      return matchesCategory && matchesSearch;
    }).toList(growable: false);
  }
}
