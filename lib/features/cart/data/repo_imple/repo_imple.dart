import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/cart/data/apis/cart_api_services.dart';
import 'package:marketos/features/cart/data/cart_model.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';
import 'package:marketos/features/cart/domain/repo/cart_repo.dart';

class CartRepoImple implements CartRepo {
  final AppFireBaseHelper appFireBaseHelper;
  final CartApiService cartApiService;

  CartRepoImple({required this.appFireBaseHelper,required this.cartApiService});

  @override
  Future<Either<Failure, CartModel>> getCartProducts() async {
    try{
      final result = await appFireBaseHelper.getUserCart();
      List<CartProductEntity> products = [];
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
  Future<Either<Failure, dynamic>> deleteAllProductsFromCart() {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartProductEntity>> getSingleProduct({required int productID}) async {
    try{
      final result = await cartApiService.getSingleProduct(
        id: productID,
      );
      CartProductEntity product = CartProductEntity(
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

}