abstract class ChangeAddressState{}

class ChangeAddressInitial extends ChangeAddressState{}

class ChangeAddressLoading extends ChangeAddressState{}

class ChangeAddressSuccess extends ChangeAddressState{}

class ChangeAddressFailed extends ChangeAddressState{
  final String message;

  ChangeAddressFailed({required this.message});
}