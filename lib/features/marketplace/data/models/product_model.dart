import '../../domain/entities/product.dart';

class ProductModel {
  const ProductModel({
    required this.id,
    required this.brand,
    required this.title,
    required this.price,
    required this.billingPeriod,
    required this.featureSummary,
    required this.category,
    required this.buttonLabel,
    this.activityText,
  });

  final String id;
  final String brand;
  final String title;
  final String price;
  final String billingPeriod;
  final String featureSummary;
  final String category;
  final String buttonLabel;
  final String? activityText;

  Product toEntity() {
    return Product(
      id: id,
      brand: brand,
      title: title,
      price: price,
      billingPeriod: billingPeriod,
      featureSummary: featureSummary,
      category: category,
      buttonLabel: buttonLabel,
      activityText: activityText,
    );
  }
}
