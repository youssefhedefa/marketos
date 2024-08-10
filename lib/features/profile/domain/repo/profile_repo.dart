import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, dynamic>> getProfile();
  Future<Either<Failure, dynamic>> changeName({required String name});
  Future<Either<Failure, dynamic>> changeImage({required String imageUrl});
  Future<Either<Failure, dynamic>> changeAddress({required String address});
}