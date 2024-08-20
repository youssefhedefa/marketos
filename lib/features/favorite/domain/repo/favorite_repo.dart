import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, List<CartOrFavoriteProductEntity>>> getFavorites();
  Future<Either<Failure, CartOrFavoriteProductEntity>> getSingleProduct({required int productID});
}