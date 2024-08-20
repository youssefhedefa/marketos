import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/networking/firebase/models/cart_product_details_model.dart';
import 'package:marketos/features/home/domain/use_cases/add_to_cart_use_case.dart';
import 'package:marketos/features/home/logic/cubits/add_to_cart_cubit/add_to_cart_states.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final AddToCartUseCase useCase;

  AddToCartCubit({required this.useCase}) : super(AddToCartInitialState());

  void addToCart({required ProductInCartDetails product}) async {
    emit(AddToCartLoadingState());
    final result = await useCase.call(product: product);
    result.fold(
      (failure) => emit(AddToCartErrorState(message: failure.message)),
      (success) => emit(AddToCartSuccessState())
    );
  }

}
