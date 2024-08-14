import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';

class RemoveFromCartUseCase {
  final HomeRepo homeRepo;

  RemoveFromCartUseCase({required this.homeRepo});

  Future<Either<Failure, dynamic>> call({required int id}) async {
    return await homeRepo.removeFromCart(productID: id);
  }
}