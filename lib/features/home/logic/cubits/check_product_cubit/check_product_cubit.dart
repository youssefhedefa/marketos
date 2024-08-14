import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';
import 'package:marketos/features/home/logic/cubits/check_product_cubit/check_product_states.dart';

class CheckProductCubit extends Cubit<CheckProductState> {

  final HomeRepo homeRepo;

  CheckProductCubit({required this.homeRepo}) : super(CheckProductInitialState());

  void checkProduct({required int productId}) async {
    emit(CheckProductLoadingState());
    final result = await homeRepo.checkIfProductIsInCart(productID: productId);
    result.fold(
      (failure) => emit(CheckProductErrorState(message: failure.message)),
      (state) => emit(CheckProductSuccessState(isProductInCart: state))
    );
  }
}