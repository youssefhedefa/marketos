import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/search/domain/use_cases/search_use_case.dart';
import 'package:marketos/features/search/logic/search_cubit/search_states.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase useCase;

  SearchCubit({required this.useCase}) : super(SearchInitialState());

  void search({required String query}) async {
    if(query.isEmpty){
      emit(SearchInitialState());
      return;
    }
    emit(SearchLoadingState());
    final response = await useCase.call(query: query);
    response.fold(
      (failure) => emit(SearchErrorState(message: failure.message)),
      (products) => emit(SearchSuccessState(products: products)),
    );
  }
}