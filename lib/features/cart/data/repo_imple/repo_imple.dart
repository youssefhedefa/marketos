import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/cart/data/apis/cart_api_services.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';
import 'package:marketos/features/cart/domain/repo/cart_repo.dart';

class CartRepoImple implements CartRepo {
  final AppFireBaseHelper appFireBaseHelper;
  final CartApiService cartApiService;

  CartRepoImple({required this.appFireBaseHelper,required this.cartApiService});

  @override
  Future<Either<Failure, List<CartProductEntity>>> getCartProducts() async {
    try{
      final result = await appFireBaseHelper.getCart(userId: appFireBaseHelper.firebaseAuth.currentUser!.uid);
      List<CartProductEntity> products = [];
      for(String i in result){
       final getResult = await getSingleProduct(productID: int.parse(i));
        getResult.fold(
          (failure) => Left(Failure(message: failure.message)),
          (product) => products.add(product)
        );
      }
      return Right(products);
    }
    catch(e){
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> removeFromCart() {
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