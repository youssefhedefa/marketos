import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/cart/data/models/payment_request.dart';
import 'package:marketos/features/cart/domain/use_case/order_use_case.dart';
import 'package:marketos/features/cart/logic/cubits/order_cubit/order_states.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderUseCase useCase;

  OrderCubit({required this.useCase}) : super(OrderInitial());

  Future<void> makeOrder({required PaymentRequestModel orderRequestModel}) async {
    emit(OrderLoading());
      final response = await useCase.call(request: orderRequestModel);
      response.fold(
        (failure) => emit(OrderFailed(message: failure.message)),
        (response) => emit(OrderSuccess(response: response))
      );
  }
}
