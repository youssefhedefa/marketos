abstract class CheckFavoriteState{}

class CheckFavoriteInitial extends CheckFavoriteState{}

class CheckFavoriteLoading extends CheckFavoriteState{}

class CheckFavoriteSuccess extends CheckFavoriteState{
  final bool isFavorite;

  CheckFavoriteSuccess({required this.isFavorite});
}

class CheckFavoriteFailure extends CheckFavoriteState{
  final String message;

  CheckFavoriteFailure({required this.message});
}