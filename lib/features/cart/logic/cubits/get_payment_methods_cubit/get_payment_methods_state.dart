import 'package:marketos/features/cart/domain/entities/payment_method_entity.dart';

abstract class GetPaymentMethodsState{}

class GetPaymentMethodsInitial extends GetPaymentMethodsState{}

class GetPaymentMethodsLoading extends GetPaymentMethodsState{}

class GetPaymentMethodsSuccess extends GetPaymentMethodsState{
  final List<PaymentMethodEntity> methods;

  GetPaymentMethodsSuccess({required this.methods});
}

class GetPaymentMethodsError extends GetPaymentMethodsState{
  final String message;

  GetPaymentMethodsError({required this.message});
}
