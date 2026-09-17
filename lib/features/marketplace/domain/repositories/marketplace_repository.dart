import '../entities/category.dart';
import '../entities/product.dart';

abstract class MarketplaceRepository {
  Future<List<Product>> getProducts();

  Future<List<Category>> getCategories();
}
