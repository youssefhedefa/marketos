import 'package:dio/dio.dart';
import 'package:marketos/core/networking/api/api_constants.dart';
import 'package:marketos/features/cart/data/apis/api_constants.dart';
import 'package:marketos/features/home/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio) = _CartApiService;

  @GET(CartApiConstants.getSingleProduct)
  Future<ProductData> getSingleProduct({@Path('id') required int id});

}