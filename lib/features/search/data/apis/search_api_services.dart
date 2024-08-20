import 'package:dio/dio.dart';
import 'package:marketos/core/networking/api/api_constants.dart';
import 'package:marketos/features/home/data/models/product_model.dart';
import 'package:marketos/features/search/data/apis/search_api_constance.dart';
import 'package:retrofit/http.dart';
part 'search_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SearchApiServices {
  factory SearchApiServices(Dio dio,) = _SearchApiServices;

  @GET(SearchApiConstance.search)
  Future<ProductModel> search(
      {@Query('q') required String query}
      );

}