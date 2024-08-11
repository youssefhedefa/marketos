import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketos/features/profile/domain/use_cases/change_image_use_case.dart';
import 'package:marketos/features/profile/logic/cubits/change_image_cubit/change_image_states.dart';

class ChangeImageCubit extends Cubit<ChangeImageState> {
  final ChangeImageUseCase useCase;

  ChangeImageCubit({required this.useCase}) : super(ChangeImageInitial());

  final ImagePicker _picker = ImagePicker();

  changeImage({required XFile image}) async {
    emit(ChangeImageLoading());
    var result = await useCase.call(image: image);
    result.fold(
      (failure) => emit(ChangeImageFailed(message: failure.message)),
      (success) => emit(ChangeImageSuccess()),
    );
  }

  Future pickImage() async {
    XFile? imageX = await _picker.pickImage(source: ImageSource.gallery);
    if (imageX!.path.isNotEmpty) {
      return imageX;
    }
    else{
      print('No image selected.');
      return null;
    }
  }

}