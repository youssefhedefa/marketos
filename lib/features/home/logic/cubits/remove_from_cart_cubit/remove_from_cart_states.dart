abstract class RemoveFromCartState{}

class RemoveFromCartInitialState extends RemoveFromCartState{}

class RemoveFromCartLoadingState extends RemoveFromCartState{}

class RemoveFromCartSuccessState extends RemoveFromCartState{}

class RemoveFromCartErrorState extends RemoveFromCartState{
  final String message;
  RemoveFromCartErrorState({required this.message});
}
