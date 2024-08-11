abstract class ChangeImageState {}

class ChangeImageInitial extends ChangeImageState {}

class ChangeImageLoading extends ChangeImageState {}

class ChangeImageSuccess extends ChangeImageState {}

class ChangeImageFailed extends ChangeImageState {
  final String message;

  ChangeImageFailed({required this.message});
}
