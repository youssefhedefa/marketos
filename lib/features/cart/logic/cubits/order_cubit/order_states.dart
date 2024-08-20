import 'package:marketos/features/cart/data/models/payment_response.dart';

abstract class OrderState{}

class OrderInitial extends OrderState{}

class OrderLoading extends OrderState{}

class OrderSuccess extends OrderState{
  final PaymentResponseModel response;
  OrderSuccess({required this.response});
}

class OrderFailed extends OrderState{
  final String message;
  OrderFailed({required this.message});
}
