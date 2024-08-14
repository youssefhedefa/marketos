import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/home/domain/use_cases/remove_from_cart_use_case.dart';
import 'package:marketos/features/home/logic/cubits/remove_from_cart_cubit/remove_from_cart_states.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  final RemoveFromCartUseCase useCase;
  RemoveFromCartCubit({required this.useCase}) : super(RemoveFromCartInitialState());

  void removeFromCart({required int productId}) async {
    emit(RemoveFromCartLoadingState());

    final result = await useCase.call(id: productId);
    result.fold(
      (error) => emit(RemoveFromCartErrorState(message: error.message)),
      (success) => emit(RemoveFromCartSuccessState()),
    );
  }
}