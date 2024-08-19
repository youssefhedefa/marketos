import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/cart/data/cart_model.dart';
import 'package:marketos/features/cart/data/models/payment_request.dart';
import 'package:marketos/features/cart/data/models/payment_response.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';
import 'package:marketos/features/cart/domain/entities/payment_method_entity.dart';

abstract class CartRepo {
  Future<Either<Failure,dynamic>> deleteAllProductsFromCart();
  Future<Either<Failure,CartModel>> getCartProducts();
  Future<Either<Failure, CartProductEntity>> getSingleProduct({required int productID});
  Future<Either<Failure, List<PaymentMethodEntity>>> getPaymentMethods();
  Future<Either<Failure, PaymentResponseModel>> order({required PaymentRequestModel request});

}