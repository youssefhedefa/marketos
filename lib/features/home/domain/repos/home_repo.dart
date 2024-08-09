import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/home/data/models/category_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<CategoryModel>>> getHomeCategories();
  Future<Either<Failure,dynamic>> getProductsByCategory();
}