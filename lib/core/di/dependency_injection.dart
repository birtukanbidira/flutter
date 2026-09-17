import '../../features/marketplace/data/datasources/marketplace_local_datasource.dart';
import '../../features/marketplace/data/repositories/marketplace_repository_impl.dart';
import '../../features/marketplace/domain/repositories/marketplace_repository.dart';
import '../../features/marketplace/domain/usecases/filter_marketplace_products.dart';
import '../../features/marketplace/domain/usecases/get_marketplace_data.dart';
import '../../features/marketplace/presentation/bloc/marketplace_bloc.dart';

class AppDependencies {
  const AppDependencies({
    required this.repository,
    required this.getMarketplaceData,
    required this.filterMarketplaceProducts,
  });

  final MarketplaceRepository repository;
  final GetMarketplaceData getMarketplaceData;
  final FilterMarketplaceProducts filterMarketplaceProducts;

  MarketplaceBloc createMarketplaceBloc() {
    return MarketplaceBloc(
      getMarketplaceData: getMarketplaceData,
      filterMarketplaceProducts: filterMarketplaceProducts,
    );
  }
}

class DependencyInjection {
  static AppDependencies create() {
    final dataSource = MarketplaceLocalDataSourceImpl();
    final repository = MarketplaceRepositoryImpl(dataSource);
    return AppDependencies(
      repository: repository,
      getMarketplaceData: GetMarketplaceData(repository),
      filterMarketplaceProducts: const FilterMarketplaceProducts(),
    );
  }
}
