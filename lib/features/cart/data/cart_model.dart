import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';

class CartModel{
  final List<CartProductEntity> cartProducts;
  final num totalPrice;

  CartModel({required this.cartProducts, required this.totalPrice});
}