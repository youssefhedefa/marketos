import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';

class GetProductsByCategoryUseCase {
  final HomeRepo homeRepo;

  GetProductsByCategoryUseCase({required this.homeRepo});

  Future<Either<Failure,List<HomeProductEntity>>> call(
      {required String category}) async {
    return homeRepo.getProductsByCategory(category: category);
  }
}