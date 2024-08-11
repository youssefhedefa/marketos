import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/profile/domain/repo/profile_repo.dart';

class ChangeImageUseCase{
  final ProfileRepo profileRepo;

  ChangeImageUseCase({required this.profileRepo});

  Future<Either<Failure, dynamic>> call({required XFile image}) async {
    return profileRepo.changeImage(image: image);
  }

}