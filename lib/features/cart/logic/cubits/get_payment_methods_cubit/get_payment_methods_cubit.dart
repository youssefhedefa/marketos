import 'package:bloc/bloc.dart';
import 'package:marketos/features/cart/domain/repo/cart_repo.dart';
import 'package:marketos/features/cart/logic/cubits/get_payment_methods_cubit/get_payment_methods_state.dart';

class GetPaymentMethodsCubit extends Cubit<GetPaymentMethodsState> {
  final CartRepo cartRepo;
  GetPaymentMethodsCubit({required this.cartRepo}) : super(GetPaymentMethodsInitial());

  getPaymentMethods() async {
    emit(GetPaymentMethodsLoading());
    final result = await cartRepo.getPaymentMethods();
    result.fold(
      (failure) => emit(GetPaymentMethodsError(message: failure.message)),
      (data) => emit(GetPaymentMethodsSuccess(methods: data))
    );
  }

}