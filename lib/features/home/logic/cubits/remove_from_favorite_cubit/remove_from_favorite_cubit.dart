import 'package:bloc/bloc.dart';
import 'package:marketos/features/home/domain/use_cases/remove_from_favorite_use_case.dart';
import 'package:marketos/features/home/logic/cubits/remove_from_favorite_cubit/remove_from_favorite_states.dart';

class RemoveFromFavoriteCubit extends Cubit<RemoveFromFavoriteState>{
  final RemoveFromFavoriteUseCase useCase;

  RemoveFromFavoriteCubit({required this.useCase}) : super(RemoveFromFavoriteInitialState());

  removeFromFavorite({required int productID}) async {
    emit(RemoveFromFavoriteLoadingState());
    final result = await useCase.call(productID: productID);
    result.fold(
      (error) => emit(RemoveFromFavoriteErrorState(message: error.message)),
      (data) => emit(RemoveFromFavoriteSuccessState()),
    );
  }


}