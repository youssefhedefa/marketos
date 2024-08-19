import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/cart/data/apis/cart_api_services.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';
import 'package:marketos/features/favorite/domain/repo/favorite_repo.dart';

class FavoriteRepoImple implements FavoriteRepo{

  final CartOrFavoriteApiService apiService;
  final AppFireBaseHelper fireBaseHelper;

  FavoriteRepoImple({required this.apiService, required this.fireBaseHelper});

  @override
  Future<Either<Failure, List<CartOrFavoriteProductEntity>>> getFavorites() async {
    try{
      final result = await fireBaseHelper.getFavorites(userId: fireBaseHelper.firebaseAuth.currentUser!.uid);
      List<CartOrFavoriteProductEntity> products = [];
      for(var i in result){
        final result = await getSingleProduct(productID: i);
        result.fold(
                (failure) => Left(Failure(message: failure.message)),
                (product) => products.add(product)
        );
      }
      return Right(products);
    }
    catch(e){
      print(' print  ${e.toString()}');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartOrFavoriteProductEntity>> getSingleProduct({required int productID}) async {
    try{
      final result = await apiService.getSingleProduct(
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
}