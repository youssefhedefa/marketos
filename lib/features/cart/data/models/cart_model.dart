import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';

class CartModel{
  final List<CartOrFavoriteProductEntity> cartProducts;
  final num totalPrice;

  CartModel({required this.cartProducts, required this.totalPrice});
}