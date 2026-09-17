import '../../domain/entities/category.dart';

class CategoryModel {
  const CategoryModel({required this.id, required this.label});

  final String id;
  final String label;

  Category toEntity() => Category(id: id, label: label);
}
