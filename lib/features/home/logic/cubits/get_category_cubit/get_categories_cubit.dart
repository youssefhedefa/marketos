import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';
import 'package:marketos/features/home/logic/cubits/get_category_cubit/get_categories_states.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  final HomeRepo homeRepo;

  GetCategoriesCubit({required this.homeRepo}) : super(GetCategoriesInitialState());

  void getCategoriesList() async {
    emit(GetCategoriesLoadingState());
    final result = await homeRepo.getHomeCategories();
    result.fold(
      (failure) => emit(GetCategoriesErrorState(message: failure.message)),
      (categories) => emit(GetCategoriesSuccessState(categories: categories)),
    );
  }
}