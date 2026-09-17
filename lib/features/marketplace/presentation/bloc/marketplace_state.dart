import 'package:equatable/equatable.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';

enum MarketplaceStatus { initial, loading, loaded, error }

class MarketplaceState extends Equatable {
  const MarketplaceState({
    this.status = MarketplaceStatus.initial,
    this.products = const [],
    this.filteredProducts = const [],
    this.categories = const [],
    this.selectedCategory = 'All',
    this.searchQuery = '',
    this.showCookieDialog = true,
    this.errorMessage,
  });

  final MarketplaceStatus status;
  final List<Product> products;
  final List<Product> filteredProducts;
  final List<Category> categories;
  final String selectedCategory;
  final String searchQuery;
  final bool showCookieDialog;
  final String? errorMessage;

  MarketplaceState copyWith({
    MarketplaceStatus? status,
    List<Product>? products,
    List<Product>? filteredProducts,
    List<Category>? categories,
    String? selectedCategory,
    String? searchQuery,
    bool? showCookieDialog,
    String? errorMessage,
  }) {
    return MarketplaceState(
      status: status ?? this.status,
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
      showCookieDialog: showCookieDialog ?? this.showCookieDialog,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        products,
        filteredProducts,
        categories,
        selectedCategory,
        searchQuery,
        showCookieDialog,
        errorMessage,
      ];
}
