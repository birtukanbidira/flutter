import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class MarketplaceLocalDataSource {
  Future<List<ProductModel>> getProducts();

  Future<List<CategoryModel>> getCategories();
}

class MarketplaceLocalDataSourceImpl implements MarketplaceLocalDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    return const [
      CategoryModel(id: 'all', label: 'All'),
      CategoryModel(id: 'svod', label: 'SVOD'),
      CategoryModel(id: 'ai', label: 'AI'),
      CategoryModel(id: 'music', label: 'Music'),
      CategoryModel(id: 'marketplace', label: 'Marketplace'),
      CategoryModel(id: 'topup', label: 'Top up'),
      CategoryModel(id: 'software', label: 'Software'),
      CategoryModel(id: 'games', label: 'Games'),
      CategoryModel(id: 'new', label: 'New'),
    ];
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    return const [
      ProductModel(
        id: '1',
        brand: 'AI+',
        title: 'Chat Assistant Pro',
        price: '4.99',
        billingPeriod: '/month',
        activityText: '5k+ active subscribers',
        featureSummary: 'Premium AI prompts and workflow packs.',
        category: 'AI',
        buttonLabel: 'Subscribe now',
      ),
      ProductModel(
        id: '2',
        brand: 'STREAMX',
        title: 'Movie Stream Family',
        price: '6.49',
        billingPeriod: '/month',
        activityText: 'Most chosen this week',
        featureSummary: 'Family streaming access with HD playback.',
        category: 'SVOD',
        buttonLabel: 'Get offer',
      ),
      ProductModel(
        id: '3',
        brand: 'SOUNDKIT',
        title: 'Music Premium Duo',
        price: '2.99',
        billingPeriod: '/month',
        featureSummary: 'Ad-free playback and offline playlists.',
        category: 'Music',
        buttonLabel: 'Unlock plan',
      ),
      ProductModel(
        id: '4',
        brand: 'CODEFLOW',
        title: 'Developer Toolkit',
        price: '11.99',
        billingPeriod: '/month',
        featureSummary: 'Cloud IDE seats with team collaboration.',
        category: 'Software',
        buttonLabel: 'Start trial',
      ),
      ProductModel(
        id: '5',
        brand: 'GAMES HUB',
        title: 'Gaming Pass Ultimate',
        price: '7.99',
        billingPeriod: '/month',
        activityText: 'Includes bonus starter packs',
        featureSummary: 'Cross-platform catalog with monthly rewards.',
        category: 'Games',
        buttonLabel: 'Join now',
      ),
      ProductModel(
        id: '6',
        brand: 'SHOPMATE',
        title: 'Marketplace Plus',
        price: '3.50',
        billingPeriod: '/month',
        featureSummary: 'Discount bundles and shared buying groups.',
        category: 'Marketplace',
        buttonLabel: 'View deal',
      ),
      ProductModel(
        id: '7',
        brand: 'TOP UP',
        title: 'Mobile Credit Boost',
        price: '1.00',
        billingPeriod: '/transaction',
        featureSummary: 'Instant digital top-up for major providers.',
        category: 'Top up',
        buttonLabel: 'Top up now',
      ),
      ProductModel(
        id: '8',
        brand: 'FRESH',
        title: 'New Arrival Bundle',
        price: '9.49',
        billingPeriod: '/month',
        activityText: 'Limited launch pricing',
        featureSummary: 'Early access package for newly added products.',
        category: 'New',
        buttonLabel: 'See details',
      ),
    ];
  }
}
