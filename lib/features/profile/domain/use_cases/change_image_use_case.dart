import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/profile/domain/repo/profile_repo.dart';
import 'package:marketos/features/registration/data/model/user_model.dart';

class ChangeImageUseCase{
  final ProfileRepo profileRepo;

  ChangeImageUseCase({required this.profileRepo});

  Future<Either<Failure, dynamic>> call({required String image}) async {
    return profileRepo.changeImage(imageUrl: image);
  }

}