import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';

abstract class CartRepo {
  Future<Either<Failure,dynamic>> removeFromCart();
  Future<Either<Failure,List<CartProductEntity>>> getCartProducts();
  Future<Either<Failure, CartProductEntity>> getSingleProduct({required int productID});
}