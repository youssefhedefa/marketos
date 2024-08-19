import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/core/networking/firebase/models/cart_product_details_model.dart';
import 'package:marketos/features/home/data/apis/home_api_service.dart';
import 'package:marketos/features/home/domain/entities/category_entity.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';

class HomeRepoImple implements HomeRepo {
  @override
  final HomeApiService homeApiService;
  @override
  final AppFireBaseHelper appFireBaseHelper;


  HomeRepoImple({required this.homeApiService,required this.appFireBaseHelper});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getHomeCategories() async {
    try {
      var categories = await homeApiService.getCategories();
      return Right(categories);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeProductEntity>>> getProductsByCategory({required String category}) async {
    try {
      var products = await homeApiService.getProductsByCategory(category: category);
      return Right(products.products);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addToCart({required ProductInCartDetails product}) async {
    try{
      final result = await appFireBaseHelper.addProductToCart(productInCartDetails: product);
      return Right(result);
    }
    catch(e){
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkIfProductIsInCart({required int productID}) async {
    try{
      final result = await appFireBaseHelper.getUserCart();
      print(result);
      if(result != null){
        if(result.cartProducts.any((element) => element.id == productID)){
          return const Right(true);
        }
        else{
          return const Right(false);
        }
      }
      else{
        return const Right(false);
      }
    }
    catch(e){
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> removeFromCart({required int productID}) async {
    try{
      final result = await appFireBaseHelper.removeProductFromCart(id: productID);
      return Right(result);
    }
    catch(e){
      return Left(Failure(message: e.toString()));
    }
  }


  @override
  Future<Either<Failure, dynamic>> addToFavorite({required ProductInCartDetails product}) async {
    try{
      final result = await appFireBaseHelper.addToFavorite(userId: appFireBaseHelper.firebaseAuth.currentUser!.uid, productId: product.id);
      return Right(result);
    }
    catch(e){
      return Left(Failure(message: e.toString()));
    }
  }

}
