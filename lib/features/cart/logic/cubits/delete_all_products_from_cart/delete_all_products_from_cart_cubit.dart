import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/cart/domain/repo/cart_repo.dart';
import 'package:marketos/features/cart/logic/cubits/delete_all_products_from_cart/delete_all_products_from_cart_states.dart';

class DeleteAllProductsFromCartCubit extends Cubit<DeleteAllProductsFromCartState> {

  final CartRepo cartRepo;

  DeleteAllProductsFromCartCubit({required this.cartRepo}) : super(DeleteAllProductsFromCartInitial());

  Future deleteAllProductsFromCart() async {
    emit(DeleteAllProductsFromCartLoading());
    final result = await cartRepo.deleteAllProductsFromCart();
    result.fold(
      (failure) => emit(DeleteAllProductsFromCartError(message: failure.message)),
      (success) => emit(DeleteAllProductsFromCartSuccess())
    );
  }
}