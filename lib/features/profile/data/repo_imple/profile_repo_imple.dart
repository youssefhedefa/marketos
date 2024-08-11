import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/profile/domain/repo/profile_repo.dart';
import 'package:marketos/features/registration/data/model/user_model.dart';

class ProfileRepoImple extends ProfileRepo {
  final AppFireBaseHelper appFireBaseHelper;

  ProfileRepoImple({required this.appFireBaseHelper});



  @override
  Future<Either<Failure, UserModel>> changeAddress({required String address}) {
    // TODO: implement changeAddress
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> changeImage({required String imageUrl}) async{
    try{
      var result = await appFireBaseHelper.updateUserImage(
          userId: appFireBaseHelper.firebaseAuth.currentUser!.uid,
          image: imageUrl
      );
      return Right(result);
    }
    catch(e){
      print(e.toString());
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> changeName({required String name}) async {
    try{
      var result = await appFireBaseHelper.changeUserName(userId: appFireBaseHelper.firebaseAuth.currentUser!.uid, name: name);
      return Right(result);
    }
    catch(e){
      print(e.toString());
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> getProfile() async {
    try{
      var result = await appFireBaseHelper.getUser(appFireBaseHelper.firebaseAuth.currentUser!.uid);
      return Right(result);
    }
    catch(e){
      print(e.toString());
      return Left(Failure(message: e.toString()));
    }
  }

}