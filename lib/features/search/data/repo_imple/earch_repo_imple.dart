import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/home/data/mapper/to_product_entity.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';
import 'package:marketos/features/search/data/apis/search_api_services.dart';
import 'package:marketos/features/search/domain/repo/search_repo.dart';

class SearchRepoImple implements SearchRepo{
  final SearchApiServices searchApiServices;

  SearchRepoImple({required this.searchApiServices});

  @override
  Future<Either<Failure,List<HomeProductEntity>>> search({required String query}) async {
    try {
      final response = await searchApiServices.search(query: query);
      List<HomeProductEntity> products = ToProductEntityMapper.listCall(data: response.products);
      return Right(products);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}