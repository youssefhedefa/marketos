abstract class DeleteAllProductsFromCartState{}

class DeleteAllProductsFromCartInitial extends DeleteAllProductsFromCartState{}

class DeleteAllProductsFromCartLoading extends DeleteAllProductsFromCartState{}

class DeleteAllProductsFromCartSuccess extends DeleteAllProductsFromCartState{}

class DeleteAllProductsFromCartError extends DeleteAllProductsFromCartState{
  final String message;
  DeleteAllProductsFromCartError({required this.message});
}