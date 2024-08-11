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

  static getCurrentLocation() async {

    if(await checkPermission() && await checkService()){
      return await Geolocator.getCurrentPosition();
    }
    return null;

  }

}