import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';

abstract class GetFavoriteState{}

class GetFavoriteInitial extends GetFavoriteState{}

class GetFavoriteLoading extends GetFavoriteState{}

class GetFavoriteSuccess extends GetFavoriteState{
  final List<CartOrFavoriteProductEntity> favoriteProducts;

  GetFavoriteSuccess({required this.favoriteProducts});
}

class GetFavoriteError extends GetFavoriteState{
  final String message;

  GetFavoriteError({required this.message});
}
