abstract class RemoveFromFavoriteState{}

class RemoveFromFavoriteInitialState extends RemoveFromFavoriteState{}

class RemoveFromFavoriteLoadingState extends RemoveFromFavoriteState{}

class RemoveFromFavoriteSuccessState extends RemoveFromFavoriteState{}

class RemoveFromFavoriteErrorState extends RemoveFromFavoriteState{
  final String message;
  RemoveFromFavoriteErrorState({required this.message});
}