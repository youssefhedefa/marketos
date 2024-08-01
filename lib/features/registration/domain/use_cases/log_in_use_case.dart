import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/registration/domain/repo/registration_repo.dart';

class LogInUseCase {
  final RegistrationRepo registrationRepo;

  LogInUseCase({required this.registrationRepo});

  Future<Either<Failure, UserCredential>> call({
    required String email,
    required String password,
  }){
    return registrationRepo.logIn(email: email, password: password);
  }

}