import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/home/data/apis/home_api_service.dart';
import 'package:marketos/features/home/domain/entities/category_entity.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';

abstract class HomeRepo{

  final HomeApiService homeApiService;
  final AppFireBaseHelper appFireBaseHelper;

  HomeRepo({required this.homeApiService,required this.appFireBaseHelper});


  Future<Either<Failure,List<CategoryEntity>>> getHomeCategories();
  Future<Either<Failure,List<HomeProductEntity>>> getProductsByCategory({required String category});

  Future<Either<Failure,dynamic>> addToCart({required int productID});
  Future<Either<Failure,bool>> checkIfProductIsInCart({required int productID});
  Future<Either<Failure,dynamic>> removeFromCart({required int productID});
}