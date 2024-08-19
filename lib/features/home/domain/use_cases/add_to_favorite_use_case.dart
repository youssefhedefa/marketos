import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/core/networking/firebase/models/cart_product_details_model.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';

class AddToFavoriteUseCase {
  final HomeRepo homeRepo;

  AddToFavoriteUseCase({required this.homeRepo});

  Future<Either<Failure,dynamic>> call({required ProductInCartDetails product}) async {
    return await homeRepo.addToFavorite(product: product);
  }

}