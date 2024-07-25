import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/registration/data/repo/registration_repo.dart';
import 'package:marketos/features/registration/logic/cubits/sigin_in_cubit/sign_in_states.dart';

class SignInCubit extends Cubit<SignInStates>{
  final RegistrationRepo registrationRepo;

  SignInCubit({required this.registrationRepo}) : super(SignInInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  signInStates({required String email, required String password}) async {
    emit(SignInLoadingState());
    var result = await registrationRepo.signIn(email: email, password: password);
    result.fold(
      (error) => emit(SignInErrorState(error: error)),
      (userCredential) => emit(SignInSuccessState())
    );
  }


}