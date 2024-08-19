import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/cart/data/apis/cart_api_services.dart';
import 'package:marketos/features/cart/data/apis/payment/payment_api_services.dart';
import 'package:marketos/features/cart/data/models/cart_model.dart';
import 'package:marketos/features/cart/data/models/payment_request.dart';
import 'package:marketos/features/cart/data/models/payment_response.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';
import 'package:marketos/features/cart/domain/entities/payment_method_entity.dart';
import 'package:marketos/features/cart/domain/repo/cart_repo.dart';

class CartRepoImple implements CartRepo {
  final AppFireBaseHelper appFireBaseHelper;
  final CartOrFavoriteApiService cartApiService;
  final PaymentApiService paymentApiService;

  CartRepoImple({required this.appFireBaseHelper,required this.cartApiService,required this.paymentApiService});

  @override
  Future<Either<Failure, CartModel>> getCartProducts() async {
    try{
      final result = await appFireBaseHelper.getUserCart();
      List<CartOrFavoriteProductEntity> products = [];
      for(var i in result?.cartProducts ?? []){
        final result = await getSingleProduct(productID: i.id);
        result.fold(
          (failure) => Left(Failure(message: failure.message)),
          (product) => products.add(product)
        );
      }
      CartModel cart = CartModel(
        cartProducts: products,
        totalPrice: result?.totalPrice ?? 0
      );
      return Right(cart);
    }
    catch(e){
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteAllProductsFromCart() async {
    try{
      final result = await appFireBaseHelper.deleteAllProductsFromCart();
      return Right(result);
    }
    catch(e){
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartOrFavoriteProductEntity>> getSingleProduct({required int productID}) async {
    try{
      final result = await cartApiService.getSingleProduct(
        id: productID,
      );
      CartOrFavoriteProductEntity product = CartOrFavoriteProductEntity(
        id: result.id,
        name: result.name,
        price: result.productPrice,
        image: result.image,
        images: result.images,
        description: result.description
      );
      return Right(product);
    }
    catch(e){
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PaymentMethodEntity>>> getPaymentMethods() async {
    try{
      final result = await paymentApiService.getPaymentMethods();
      List<PaymentMethodEntity> methods = result.data.where((element) => element.redirect == 'true').map((e) => PaymentMethodEntity(
        id: e.id,
        name: e.name,
        image: e.image
      )).toList();
      return Right(methods);
    }
    catch(e){
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaymentResponseModel>> order({required PaymentRequestModel request}) async {
    try{
      final result = await paymentApiService.requestPayment(paymentRequest: request);
      return Right(result);
    }
    catch(e){
      return Left(Failure(message: e.toString()));
    }
  }

}