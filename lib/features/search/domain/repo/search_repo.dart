import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<HomeProductEntity>>> search({required String query});
}