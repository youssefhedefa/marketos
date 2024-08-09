import 'package:marketos/features/home/domain/entities/category_entity.dart';

abstract class GetCategoriesState{}

class GetCategoriesInitialState extends GetCategoriesState{}

class GetCategoriesLoadingState extends GetCategoriesState{}

class GetCategoriesSuccessState extends GetCategoriesState{
  final List<CategoryEntity> categories;

  GetCategoriesSuccessState({required this.categories});
}

class GetCategoriesErrorState extends GetCategoriesState{
  final String message;

  GetCategoriesErrorState({required this.message});
}
