abstract class AddToFavoriteState{}

class AddToFavoriteInitial extends AddToFavoriteState{}

class AddToFavoriteLoading extends AddToFavoriteState{}

class AddToFavoriteSuccess extends AddToFavoriteState{}

class AddToFavoriteFailure extends AddToFavoriteState{
  final String message;

  AddToFavoriteFailure({required this.message});
}