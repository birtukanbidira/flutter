import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
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

  @override
  List<Object?> get props => [
        id,
        brand,
        title,
        price,
        billingPeriod,
        featureSummary,
        category,
        buttonLabel,
        activityText,
      ];
}
