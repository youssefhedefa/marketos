import 'package:marketos/features/registration/data/model/user_model.dart';

abstract class GetProfileState{}


class GetProfileInitial extends GetProfileState{}

class GetProfileLoading extends GetProfileState{}

class GetProfileSuccess extends GetProfileState{
  final UserModel profile;

  GetProfileSuccess({required this.profile});
}

class GetProfileFailed extends GetProfileState{
  final String message;

  GetProfileFailed({required this.message});
}