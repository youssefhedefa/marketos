import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/profile/domain/repo/profile_repo.dart';

class ChangeNameUseCase{
  final ProfileRepo profileRepo;

  ChangeNameUseCase({required this.profileRepo});

  Future<Either<Failure, dynamic>> call({required String name}) async {
    return profileRepo.changeName(name: name);
  }

}