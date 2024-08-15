import 'package:marketos/features/cart/data/cart_model.dart';

abstract class GetCartState{}

class GetCartInitial extends GetCartState{}

class GetCartLoading extends GetCartState{}

class GetCartSuccess extends GetCartState{
  final CartModel cart;
  GetCartSuccess({required this.cart});
}

class GetCartError extends GetCartState{
  final String message;
  GetCartError({required this.message});
}