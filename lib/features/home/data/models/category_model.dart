import 'package:marketos/features/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final String name;
  final String slug;

  CategoryModel({
    required this.name,
    required this.slug,
  }) : super(
          category: name,
          ref: slug,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      slug: json['slug'],
    );
  }
}
