import 'package:marketos/core/networking/firebase/models/cart_product_details_model.dart';

class UserCart{
  final List<ProductInCartDetails> cartProducts;
  final num totalPrice;

  UserCart({required this.cartProducts, required this.totalPrice});


  Map<String, dynamic> toMap() {
    return {
      'cartProducts': cartProducts.map((e) => e.toMap()).toList(),
      'totalPrice': totalPrice,
    };
  }

  factory UserCart.fromMap(Map<String, dynamic> map) {
    return UserCart(
      cartProducts: List<ProductInCartDetails>.from(map['cartProducts'].map((x) => ProductInCartDetails.fromMap(x))),
      totalPrice: map['totalPrice'],
    );
  }

}