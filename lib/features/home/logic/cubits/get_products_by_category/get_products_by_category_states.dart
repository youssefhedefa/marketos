import 'package:marketos/features/home/domain/entities/home_product_entity.dart';

abstract class GetProductsByCategoryState{}

// get products by category initial state

class GetProductsByCategoryInitialState extends GetProductsByCategoryState{}

class GetProductsByCategoryLoadingState extends GetProductsByCategoryState{}

class GetProductsByCategorySuccessState extends GetProductsByCategoryState{
  final List<HomeProductEntity> products;

  GetProductsByCategorySuccessState({required this.products});
}

class GetProductsByCategoryErrorState extends GetProductsByCategoryState{
  final String message;

  GetProductsByCategoryErrorState({required this.message});
}