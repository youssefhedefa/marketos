import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/registration/domain/use_cases/sign_in_use_case.dart';
import 'package:marketos/features/registration/logic/cubits/sign_in_cubit/sign_in_states.dart';

class SignInCubit extends Cubit<SignInStates>{
  final SignInUseCase signInUseCase;

  SignInCubit({required this.signInUseCase,}) : super(SignInInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  signInStates({required String email,required String password}) async {
    emit(SignInLoadingState());
    var result = await signInUseCase.call(email: email, password: password,);
    result.fold(
      (error) => emit(SignInErrorState(error: Failure(message: error.message))),
      (userCredential) => emit(SignInSuccessState())
    );
  }


}