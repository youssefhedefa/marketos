import 'package:marketos/core/failure/failure.dart';

abstract class LogInStates{}

class LogInInitialState extends LogInStates{}

class LogInLoadingState extends LogInStates{}

class LogInSuccessState extends LogInStates{}

class LogInErrorState extends LogInStates{
  final Failure error;

  LogInErrorState({required this.error});
}