import 'package:marketos/core/failure/failure.dart';

abstract class SignInStates{}

class SignInInitialState extends SignInStates{}

class SignInLoadingState extends SignInStates{}

class SignInSuccessState extends SignInStates{}

class SignInErrorState extends SignInStates{
  final Failure error;

  SignInErrorState({required this.error});
}