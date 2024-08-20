import 'package:dio/dio.dart';
import 'package:marketos/core/networking/api/api_constants.dart';
import 'package:marketos/features/home/data/apis/home_api_constants.dart';
import 'package:marketos/features/home/data/models/category_model.dart';
import 'package:marketos/features/home/data/models/product_model.dart';
import 'package:retrofit/http.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService{
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.getHomeCategories)
  Future<List<CategoryModel>> getCategories();

  @GET(HomeApiConstants.getProductsByCategory)
  Future<ProductModel> getProductsByCategory(
      {@Path('category') required String category});

}