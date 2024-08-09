import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/home/data/apis/home_api_service.dart';
import 'package:marketos/features/home/domain/entities/category_entity.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';

class HomeRepoImple implements HomeRepo {
  @override
  final HomeApiService homeApiService;

  HomeRepoImple({required this.homeApiService});

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
}
