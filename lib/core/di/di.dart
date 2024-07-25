import 'package:get_it/get_it.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/registration/data/repo/registration_repo.dart';
import 'package:marketos/features/registration/logic/cubits/sigin_in_cubit/sign_in_cubit.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<AppFireBaseHelper>(() => AppFireBaseHelper());
  getIt.registerLazySingleton<RegistrationRepo>(() => RegistrationRepo(appFireBaseHelper: getIt()));

  getIt.registerFactory<SignInCubit>(() => SignInCubit(registrationRepo: getIt()));

}
