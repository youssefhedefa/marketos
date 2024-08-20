abstract class CheckProductState{}

class CheckProductInitialState extends CheckProductState{}

class CheckProductLoadingState extends CheckProductState{}

class CheckProductSuccessState extends CheckProductState{
  final bool isProductInCart;
  CheckProductSuccessState({required this.isProductInCart});

}

class CheckProductErrorState extends CheckProductState{
  final String message;
  CheckProductErrorState({required this.message});
}