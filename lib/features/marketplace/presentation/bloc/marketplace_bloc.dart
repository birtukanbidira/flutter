import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/filter_marketplace_products.dart';
import '../../domain/usecases/get_marketplace_data.dart';
import 'marketplace_event.dart';
import 'marketplace_state.dart';

class MarketplaceBloc extends Bloc<MarketplaceEvent, MarketplaceState> {
  MarketplaceBloc({
    required GetMarketplaceData getMarketplaceData,
    required FilterMarketplaceProducts filterMarketplaceProducts,
  })  : _getMarketplaceData = getMarketplaceData,
        _filterMarketplaceProducts = filterMarketplaceProducts,
        super(const MarketplaceState()) {
    on<MarketplaceRequested>(_onRequested);
    on<MarketplaceCategorySelected>(_onCategorySelected);
    on<MarketplaceSearchChanged>(_onSearchChanged);
    on<MarketplaceCookieAccepted>(_onCookieHandled);
    on<MarketplaceCookieDismissed>(_onCookieHandled);
  }

  final GetMarketplaceData _getMarketplaceData;
  final FilterMarketplaceProducts _filterMarketplaceProducts;

  Future<void> _onRequested(
    MarketplaceRequested event,
    Emitter<MarketplaceState> emit,
  ) async {
    emit(state.copyWith(status: MarketplaceStatus.loading));
    try {
      final data = await _getMarketplaceData();
      final filteredProducts = _filterMarketplaceProducts(
        products: data.products,
        selectedCategory: state.selectedCategory,
        searchQuery: state.searchQuery,
      );
      emit(
        state.copyWith(
          status: MarketplaceStatus.loaded,
          products: data.products,
          filteredProducts: filteredProducts,
          categories: data.categories,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MarketplaceStatus.error,
          errorMessage: 'Unable to load marketplace data.',
        ),
      );
    }
  }

  void _onCategorySelected(
    MarketplaceCategorySelected event,
    Emitter<MarketplaceState> emit,
  ) {
    final filteredProducts = _filterMarketplaceProducts(
      products: state.products,
      selectedCategory: event.category,
      searchQuery: state.searchQuery,
    );
    emit(
      state.copyWith(
        selectedCategory: event.category,
        filteredProducts: filteredProducts,
      ),
    );
  }

  void _onSearchChanged(
    MarketplaceSearchChanged event,
    Emitter<MarketplaceState> emit,
  ) {
    final filteredProducts = _filterMarketplaceProducts(
      products: state.products,
      selectedCategory: state.selectedCategory,
      searchQuery: event.query,
    );
    emit(
      state.copyWith(
        searchQuery: event.query,
        filteredProducts: filteredProducts,
      ),
    );
  }

  void _onCookieHandled(
    MarketplaceEvent event,
    Emitter<MarketplaceState> emit,
  ) {
    emit(state.copyWith(showCookieDialog: false));
  }
}
