import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/registration/data/model/user_model.dart';
import 'package:marketos/features/registration/domain/use_cases/log_in_use_case.dart';
import 'package:marketos/features/registration/logic/cubits/log_in_cubit/log_in_states.dart';

class LogInCubit extends Cubit<LogInStates>{
  final LogInUseCase logInUseCase;

  LogInCubit({required this.logInUseCase,}) : super(LogInInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  signInStates({required UserModel userModel}) async {
    emit(LogInLoadingState());
    var result = await logInUseCase.call(email: userModel.email, password: userModel.password,);
    result.fold(
            (error) => emit(LogInErrorState(error: Failure(message: error.message))),
            (userCredential) async{
          emit(LogInSuccessState());
        }
    );
  }


}