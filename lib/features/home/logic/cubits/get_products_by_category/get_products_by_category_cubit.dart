import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/home/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:marketos/features/home/logic/cubits/get_products_by_category/get_products_by_category_states.dart';

class GetProductByCategoryCubit extends Cubit<GetProductsByCategoryState> {
  final GetProductsByCategoryUseCase useCase;

  GetProductByCategoryCubit({required this.useCase})
      : super(GetProductsByCategoryInitialState());

  Future<void> getProductByCategory(String category) async {
    emit(GetProductsByCategoryLoadingState());
    final result = await useCase.call(category: category);
    result.fold(
      (error) => emit(GetProductsByCategoryErrorState(message: error.message)),
      (products) => emit(GetProductsByCategorySuccessState(products: products)),
    );
  }
}