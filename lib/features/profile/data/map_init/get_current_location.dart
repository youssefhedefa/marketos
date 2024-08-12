import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

abstract class GetCurrentLocation{
  static checkPermission() async {
    var permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.whileInUse || permission == LocationPermission.always){
      return true;
    }
    return false;
  }

  static checkService() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<Either<Position, String>> getCurrentLocation() async {

    if(!await checkPermission()){
      return Right(CheckConstantsExtension(CheckConstants.permission).value);
    }
    else if(!await checkService()){
      return Right(CheckConstantsExtension(CheckConstants.service).value);
    }
    else{
      return Left(await Geolocator.getCurrentPosition());
    }
  }
}


enum CheckConstants{
  permission,
  service
}



extension CheckConstantsExtension on CheckConstants{
  String get value{
    switch(this){
      case CheckConstants.permission:
        return 'Permission not granted';
      case CheckConstants.service:
        return 'Location service not enabled';
      default:
        return '';
    }
  }
}