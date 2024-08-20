abstract class AddToCartState{}

class AddToCartInitialState extends AddToCartState{}

class AddToCartLoadingState extends AddToCartState{}

class AddToCartSuccessState extends AddToCartState{}

class AddToCartErrorState extends AddToCartState{
  final String message;
  AddToCartErrorState({required this.message});
}