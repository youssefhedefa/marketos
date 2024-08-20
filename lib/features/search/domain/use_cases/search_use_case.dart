import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';
import 'package:marketos/features/search/domain/repo/search_repo.dart';

class SearchUseCase{
  final SearchRepo searchRepo;

  SearchUseCase({required this.searchRepo});

  Future<Either<Failure,List<HomeProductEntity>>> call ({required String query}) async {
    return await searchRepo.search(query: query);
  }

}