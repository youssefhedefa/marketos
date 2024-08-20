import 'package:marketos/features/home/domain/entities/home_product_entity.dart';

class ViewAllModel {
  final List<HomeProductEntity> products;
  final String categoryName;

  ViewAllModel({required this.products, required this.categoryName});
}