import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/profile/domain/use_cases/change_name_use_case.dart';
import 'package:marketos/features/profile/logic/cubits/change_name_cubit/change_name_states.dart';

class ChangeNameCubit extends Cubit<ChangeNameState> {
  final ChangeNameUseCase useCase;

  ChangeNameCubit({required this.useCase}) : super(ChangeNameInitial());

  TextEditingController nameController = TextEditingController();

  Future<void> changeName({required String name}) async {
    emit(ChangeNameLoading());
    final result = await useCase.call(name: name);
    result.fold(
      (failure) => emit(ChangeNameFailed(message: failure.message)),
      (userModel) => emit(ChangeNameSuccess()),
    );
  }
}