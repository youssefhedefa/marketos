import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/home/domain/entities/category_entity.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<CategoryEntity>>> getHomeCategories();
  Future<Either<Failure,List<HomeProductEntity>>> getProductsByCategory();
}