import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/cart/domain/repo/cart_repo.dart';
import 'package:marketos/features/cart/logic/cubits/get_cart_cubit/get_cart_states.dart';

class GetCartCubit extends Cubit<GetCartState> {

  final CartRepo cartRepo;

  GetCartCubit({required this.cartRepo}) : super(GetCartInitial());

  getCartProducts() async {
    emit(GetCartLoading());
    final result = await cartRepo.getCartProducts();
    result.fold(
      (failure) => emit(GetCartError(message: failure.message)),
      (cartProducts) => emit(GetCartSuccess(cart: cartProducts))
    );
  }

}