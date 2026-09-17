import '../entities/category.dart';
import '../entities/product.dart';
import '../repositories/marketplace_repository.dart';

class MarketplaceData {
  const MarketplaceData({required this.products, required this.categories});

  final List<Product> products;
  final List<Category> categories;
}

class GetMarketplaceData {
  const GetMarketplaceData(this._repository);

  final MarketplaceRepository _repository;

  Future<MarketplaceData> call() async {
    final results = await Future.wait<dynamic>([
      _repository.getProducts(),
      _repository.getCategories(),
    ]);
    return MarketplaceData(
      products: results[0] as List<Product>,
      categories: results[1] as List<Category>,
    );
  }
}
