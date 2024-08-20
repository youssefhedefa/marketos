import 'package:marketos/features/home/domain/entities/home_product_entity.dart';

abstract class SearchState{}

class SearchInitialState extends SearchState{}

class SearchLoadingState extends SearchState{}

class SearchSuccessState extends SearchState{
  final List<HomeProductEntity> products;
  SearchSuccessState({required this.products});
}

class SearchErrorState extends SearchState{
  final String message;
  SearchErrorState({required this.message});
}