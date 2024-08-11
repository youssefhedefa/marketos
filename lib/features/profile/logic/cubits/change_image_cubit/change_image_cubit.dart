import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/profile/domain/use_cases/change_image_use_case.dart';
import 'package:marketos/features/profile/logic/cubits/change_image_cubit/change_image_states.dart';

class ChangeImageCubit extends Cubit<ChangeImageState> {
  final ChangeImageUseCase useCase;
  ChangeImageCubit({required this.useCase}) : super(ChangeImageInitial());

  changeImage({required String imageUrl}) async {
    emit(ChangeImageLoading());
    var result = await useCase.call(image: imageUrl);
    result.fold(
      (failure) => emit(ChangeImageFailed(message: failure.message)),
      (success) => emit(ChangeImageSuccess()),
    );
  }
}