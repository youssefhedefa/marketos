import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketos/core/networking/api/dio_factory.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/home/data/apis/home_api_service.dart';
import 'package:marketos/features/home/data/repos_imple/home_repo_imple.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';
import 'package:marketos/features/home/logic/cubits/get_category_cubit/get_categories_cubit.dart';
import 'package:marketos/features/registration/data/repo_imple/registration_repo_imple.dart';
import 'package:marketos/features/registration/domain/use_cases/log_in_use_case.dart';
import 'package:marketos/features/registration/domain/use_cases/sign_in_use_case.dart';
import 'package:marketos/features/registration/logic/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:marketos/features/registration/logic/cubits/sign_in_cubit/sign_in_cubit.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() async {

  Dio dio = await DioFactory.getDio();

  getIt.registerLazySingleton<AppFireBaseHelper>(() => AppFireBaseHelper());
  getIt.registerLazySingleton<RegistrationRepoImple>(() => RegistrationRepoImple(appFireBaseHelper: getIt<AppFireBaseHelper>()));

  getIt.registerLazySingleton<LogInUseCase>(() => LogInUseCase(registrationRepo: getIt<RegistrationRepoImple>()));
  getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase(registrationRepo: getIt<RegistrationRepoImple>()));


  getIt.registerLazySingleton<SignInCubit>(() => SignInCubit(signInUseCase: getIt<SignInUseCase>()));
  getIt.registerLazySingleton<LogInCubit>(() => LogInCubit(logInUseCase: getIt<LogInUseCase>()));

  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));

  //home

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImple(homeApiService: getIt<HomeApiService>()));
  getIt.registerLazySingleton<GetCategoriesCubit>(() => GetCategoriesCubit(homeRepo: getIt<HomeRepo>()));
}
