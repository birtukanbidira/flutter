import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/marketplace_repository.dart';
import '../datasources/marketplace_local_datasource.dart';

class MarketplaceRepositoryImpl implements MarketplaceRepository {
  const MarketplaceRepositoryImpl(this._localDataSource);

  final MarketplaceLocalDataSource _localDataSource;

  @override
  Future<List<Category>> getCategories() async {
    final categories = await _localDataSource.getCategories();
    return categories.map((category) => category.toEntity()).toList();
  }

  @override
  Future<List<Product>> getProducts() async {
    final products = await _localDataSource.getProducts();
    return products.map((product) => product.toEntity()).toList();
  }
}
