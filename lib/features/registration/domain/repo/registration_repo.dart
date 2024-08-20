import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketos/core/failure/failure.dart';

abstract class RegistrationRepo {
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserCredential>> logIn({
    required String email,
    required String password,
  });
}