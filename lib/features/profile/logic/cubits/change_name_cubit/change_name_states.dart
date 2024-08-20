abstract class ChangeNameState{}

class ChangeNameInitial extends ChangeNameState{}

class ChangeNameLoading extends ChangeNameState{}

class ChangeNameSuccess extends ChangeNameState{}

class ChangeNameFailed extends ChangeNameState{
  final String message;

  ChangeNameFailed({required this.message});
}