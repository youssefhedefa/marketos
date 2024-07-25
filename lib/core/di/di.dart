import 'package:get_it/get_it.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/registration/data/repo/registration_repo.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<AppFireBaseHelper>(() => AppFireBaseHelper());
  getIt.registerLazySingleton<RegistrationRepo>(() => RegistrationRepo(appFireBaseHelper: getIt()));
}
