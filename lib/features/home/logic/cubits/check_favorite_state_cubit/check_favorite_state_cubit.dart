import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';
import 'package:marketos/features/home/logic/cubits/check_favorite_state_cubit/check_favorite_state_states.dart';

class CheckFavoriteStateCubit extends Cubit<CheckFavoriteState> {

  final HomeRepo homeRepo;

  CheckFavoriteStateCubit({required this.homeRepo}) : super(CheckFavoriteInitial());


  void checkFavorite({required int productID}) async {
    emit(CheckFavoriteLoading());
    final result = await homeRepo.checkIfProductIsInFavorite(productID: productID);
    result.fold(
      (failure) => emit(CheckFavoriteFailure(message: failure.message)),
      (isFavorite) => emit(CheckFavoriteSuccess(isFavorite: isFavorite)),
    );
  }

}