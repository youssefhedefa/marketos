import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/networking/firebase/models/cart_product_details_model.dart';
import 'package:marketos/features/home/domain/use_cases/add_to_favorite_use_case.dart';
import 'package:marketos/features/home/logic/cubits/add_to_favorite_cubit/add_to_favorite_state.dart';

class AddToFavoriteCubit extends Cubit<AddToFavoriteState> {
  final AddToFavoriteUseCase useCase;

  AddToFavoriteCubit({required this.useCase}) : super(AddToFavoriteInitial());

  addToFavorite({required ProductInCartDetails product}) async {
    emit(AddToFavoriteLoading());
    final result = await useCase.call(product: product);
    result.fold(
      (l) => emit(AddToFavoriteFailure(message: l.message)),
      (r) => emit(AddToFavoriteSuccess()),
    );
  }
}
