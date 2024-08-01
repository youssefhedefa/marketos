import 'package:get_it/get_it.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/registration/data/repo_imple/registration_repo_imple.dart';
import 'package:marketos/features/registration/domain/use_cases/log_in_use_case.dart';
import 'package:marketos/features/registration/domain/use_cases/sign_in_use_case.dart';
import 'package:marketos/features/registration/logic/cubits/sign_in_cubit/sign_in_cubit.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<AppFireBaseHelper>(() => AppFireBaseHelper());
  getIt.registerLazySingleton<RegistrationRepoImple>(() => RegistrationRepoImple(appFireBaseHelper: getIt<AppFireBaseHelper>()));

  getIt.registerLazySingleton<LogInUseCase>(() => LogInUseCase(registrationRepo: getIt<RegistrationRepoImple>()));
  getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase(registrationRepo: getIt<RegistrationRepoImple>()));


  getIt.registerFactory<SignInCubit>(() => SignInCubit(signInUseCase: getIt<SignInUseCase>()));

}
