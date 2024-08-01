import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/registration/domain/repo/registration_repo.dart';

class RegistrationRepoImple implements RegistrationRepo {
  final AppFireBaseHelper appFireBaseHelper;

  RegistrationRepoImple({required this.appFireBaseHelper});

  @override
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await appFireBaseHelper.createUser(email: email, password: password);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(Failure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await appFireBaseHelper.logIn(email: email, password: password);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(Failure(message: e.code));
    }
  }

}