import 'package:dio/dio.dart';
import 'package:marketos/core/constants/api_constants.dart';
import 'package:retrofit/http.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService{
  factory HomeApiService(Dio dio) = _HomeApiService;

}