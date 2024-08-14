import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';

abstract class GetCartState{}


class GetCartInitial extends GetCartState{}

class GetCartLoading extends GetCartState{}

class GetCartSuccess extends GetCartState{
  final List<CartProductEntity> cartProducts;
  GetCartSuccess({required this.cartProducts});
}

class GetCartError extends GetCartState{
  final String message;
  GetCartError({required this.message});
}