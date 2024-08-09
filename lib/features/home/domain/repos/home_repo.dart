import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<dynamic,dynamic>> getHomeCategories();
  Future<Either<dynamic,dynamic>> getProductsByCategory();
}