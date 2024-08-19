import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/favorite/domain/repo/favorite_repo.dart';
import 'package:marketos/features/favorite/logic/get_favorite_cubit/get_favorite_states.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  final FavoriteRepo repo;

  GetFavoriteCubit({required this.repo}) : super(GetFavoriteInitial());

  getFavorites() async {
    emit(GetFavoriteLoading());
    final result = await repo.getFavorites();
    result.fold(
      (failure) => emit(GetFavoriteError(message: failure.message)),
      (products) => emit(GetFavoriteSuccess(favoriteProducts: products)),
    );
  }
}