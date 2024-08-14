import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';

class AddToCartUseCase{
  final HomeRepo homeRepo;

  AddToCartUseCase({required this.homeRepo});

  Future<Either<Failure, dynamic>> call({required int productID}) async {
    return await homeRepo.addToCart(productID: productID);
  }

}