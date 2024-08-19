import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/features/profile/domain/repo/profile_repo.dart';
import 'package:marketos/features/profile/logic/cubits/get_profile_cubit/get_profile_states.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final ProfileRepo repo;

  GetProfileCubit({required this.repo}) : super(GetProfileInitial());

  Future getProfile() async {
    emit(GetProfileLoading());
    final result = await repo.getProfile();
    result.fold(
      (failure) => emit(GetProfileFailed(message: failure.message)),
      (profile) => emit(GetProfileSuccess(profile: profile)),
    );
  }
}