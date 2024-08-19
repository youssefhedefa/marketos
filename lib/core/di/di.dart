import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketos/core/networking/api/dio_factory.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/features/cart/data/apis/cart_api_services.dart';
import 'package:marketos/features/cart/data/apis/payment/payment_api_services.dart';
import 'package:marketos/features/cart/data/repo_imple/repo_imple.dart';
import 'package:marketos/features/cart/domain/repo/cart_repo.dart';
import 'package:marketos/features/cart/domain/use_case/order_use_case.dart';
import 'package:marketos/features/cart/logic/cubits/delete_all_products_from_cart/delete_all_products_from_cart_cubit.dart';
import 'package:marketos/features/cart/logic/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:marketos/features/cart/logic/cubits/get_payment_methods_cubit/get_payment_methods_cubit.dart';
import 'package:marketos/features/cart/logic/cubits/order_cubit/order_cubit.dart';
import 'package:marketos/features/home/data/apis/home_api_service.dart';
import 'package:marketos/features/home/data/repos_imple/home_repo_imple.dart';
import 'package:marketos/features/home/domain/repos/home_repo.dart';
import 'package:marketos/features/home/domain/use_cases/add_to_cart_use_case.dart';
import 'package:marketos/features/home/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:marketos/features/home/domain/use_cases/remove_from_cart_use_case.dart';
import 'package:marketos/features/home/logic/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:marketos/features/home/logic/cubits/check_product_cubit/check_product_cubit.dart';
import 'package:marketos/features/home/logic/cubits/get_category_cubit/get_categories_cubit.dart';
import 'package:marketos/features/home/logic/cubits/get_products_by_category/get_products_by_category_cubit.dart';
import 'package:marketos/features/home/logic/cubits/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:marketos/features/profile/data/repo_imple/profile_repo_imple.dart';
import 'package:marketos/features/profile/domain/repo/profile_repo.dart';
import 'package:marketos/features/profile/domain/use_cases/change_address_use_case.dart';
import 'package:marketos/features/profile/domain/use_cases/change_image_use_case.dart';
import 'package:marketos/features/profile/domain/use_cases/change_name_use_case.dart';
import 'package:marketos/features/profile/logic/cubits/change_address_cubit/change_Address_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/change_image_cubit/change_image_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/change_name_cubit/change_name_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/get_profile_cubit/get_profile_cubit.dart';
import 'package:marketos/features/registration/data/repo_imple/registration_repo_imple.dart';
import 'package:marketos/features/registration/domain/use_cases/log_in_use_case.dart';
import 'package:marketos/features/registration/domain/use_cases/sign_in_use_case.dart';
import 'package:marketos/features/registration/logic/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:marketos/features/registration/logic/cubits/sign_in_cubit/sign_in_cubit.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() async {
  Dio dio = await DioFactory.getDio();

  getIt.registerLazySingleton<AppFireBaseHelper>(() => AppFireBaseHelper());
  getIt.registerLazySingleton<RegistrationRepoImple>(() =>
      RegistrationRepoImple(appFireBaseHelper: getIt<AppFireBaseHelper>()));

  getIt.registerLazySingleton<LogInUseCase>(
      () => LogInUseCase(registrationRepo: getIt<RegistrationRepoImple>()));
  getIt.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(registrationRepo: getIt<RegistrationRepoImple>()));

  getIt.registerFactory<SignInCubit>(
      () => SignInCubit(signInUseCase: getIt<SignInUseCase>()));
  getIt.registerFactory<LogInCubit>(
      () => LogInCubit(logInUseCase: getIt<LogInUseCase>()));

  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));

  // home

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImple(
      homeApiService: getIt<HomeApiService>(),
      appFireBaseHelper: getIt<AppFireBaseHelper>()));
  getIt.registerLazySingleton<GetProductsByCategoryUseCase>(
      () => GetProductsByCategoryUseCase(homeRepo: getIt<HomeRepo>()));
  getIt.registerFactory<GetCategoriesCubit>(
      () => GetCategoriesCubit(homeRepo: getIt<HomeRepo>()));
  getIt.registerFactory<GetProductByCategoryCubit>(() =>
      GetProductByCategoryCubit(
          useCase: getIt<GetProductsByCategoryUseCase>()));

  // profile

  getIt.registerLazySingleton<ProfileRepo>(
      () => ProfileRepoImple(appFireBaseHelper: getIt<AppFireBaseHelper>()));
  getIt.registerFactory<GetProfileCubit>(
      () => GetProfileCubit(repo: getIt<ProfileRepo>()));

  getIt.registerLazySingleton<ChangeNameUseCase>(
      () => ChangeNameUseCase(profileRepo: getIt<ProfileRepo>()));
  getIt.registerFactory<ChangeNameCubit>(
      () => ChangeNameCubit(useCase: getIt<ChangeNameUseCase>()));

  getIt.registerLazySingleton<ChangeImageUseCase>(
      () => ChangeImageUseCase(profileRepo: getIt<ProfileRepo>()));
  getIt.registerFactory<ChangeImageCubit>(
      () => ChangeImageCubit(useCase: getIt<ChangeImageUseCase>()));

  getIt.registerLazySingleton<ChangeAddressUseCase>(
      () => ChangeAddressUseCase(profileRepo: getIt<ProfileRepo>()));
  getIt.registerFactory<ChangeAddressCubit>(
      () => ChangeAddressCubit(useCase: getIt<ChangeAddressUseCase>()));

  // cart
  getIt.registerLazySingleton<CartApiService>(() => CartApiService(dio));
  getIt.registerLazySingleton<PaymentApiService>(() => PaymentApiService(dio));
  getIt.registerLazySingleton<CartRepo>(() => CartRepoImple(
      appFireBaseHelper: getIt<AppFireBaseHelper>(),
      cartApiService: getIt<CartApiService>(),
      paymentApiService: getIt<PaymentApiService>()));
  getIt.registerFactory<GetCartCubit>(
      () => GetCartCubit(cartRepo: getIt<CartRepo>()));

  getIt.registerLazySingleton<AddToCartUseCase>(
      () => AddToCartUseCase(homeRepo: getIt<HomeRepo>()));
  getIt.registerFactory<AddToCartCubit>(
      () => AddToCartCubit(useCase: getIt<AddToCartUseCase>()));
  getIt.registerLazySingleton<RemoveFromCartUseCase>(
      () => RemoveFromCartUseCase(homeRepo: getIt<HomeRepo>()));
  getIt.registerFactory<RemoveFromCartCubit>(
      () => RemoveFromCartCubit(useCase: getIt<RemoveFromCartUseCase>()));
  getIt.registerFactory<CheckProductCubit>(
      () => CheckProductCubit(homeRepo: getIt<HomeRepo>()));

  getIt.registerFactory<GetPaymentMethodsCubit>(
      () => GetPaymentMethodsCubit(cartRepo: getIt<CartRepo>()));

  getIt.registerLazySingleton<OrderUseCase>(() => OrderUseCase(repo: getIt<CartRepo>()));

  getIt.registerFactory<OrderCubit>(
      () => OrderCubit(useCase: getIt<OrderUseCase>()));

  getIt.registerFactory<DeleteAllProductsFromCartCubit>(
      () => DeleteAllProductsFromCartCubit(cartRepo: getIt<CartRepo>()));
}
