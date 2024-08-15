abstract class OrderNowState{}

class OrderNowInitial extends OrderNowState{}

class OrderNowLoading extends OrderNowState{}

class OrderNowSuccess extends OrderNowState{}

class OrderNowError extends OrderNowState{
  final String message;

  OrderNowError({required this.message});
}

class AddProductSuccess extends OrderNowState{}

class RemoveProductSuccess extends OrderNowState{}

class GetTotalPriceSuccess extends OrderNowState{
  final num totalPrice;

  GetTotalPriceSuccess({required this.totalPrice});
}