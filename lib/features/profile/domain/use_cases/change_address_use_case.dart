import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/profile/domain/repo/profile_repo.dart';
import 'package:marketos/features/registration/data/model/user_model.dart';

class ChangeAddressUseCase{
  final ProfileRepo profileRepo;

  ChangeAddressUseCase({required this.profileRepo});

  Future<Either<Failure, dynamic>> call({required String address}) async {
    return profileRepo.changeAddress(address: address);
  }

}