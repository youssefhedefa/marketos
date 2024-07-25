import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/registration/data/model/user_model.dart';

class RegistrationRepo {
  final AppFireBaseHelper appFireBaseHelper;

  RegistrationRepo({required this.appFireBaseHelper});

  Future<Either<String, UserCredential>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await appFireBaseHelper.createUser(email: email, password: password);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(e.message!);
    }
  }

  Future<Either<String, UserCredential>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await appFireBaseHelper.logIn(email: email, password: password);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(e.message!);
    }
  }

  Future<Either<String,bool>> addUser({required UserModel userModel}) async {
    try{
      appFireBaseHelper.addNewUser(userModel);
      return right(true);
    }on FirebaseAuthException catch (e) {
      return left(e.message!);
    }
  }
}