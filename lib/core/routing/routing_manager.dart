import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/di/di.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/cart/domain/entities/payment_method_entity.dart';
import 'package:marketos/features/cart/ui/payment_methods_view.dart';
import 'package:marketos/features/home/data/models/view_all_model.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';
import 'package:marketos/features/home/logic/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:marketos/features/home/logic/cubits/check_product_cubit/check_product_cubit.dart';
import 'package:marketos/features/home/logic/cubits/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:marketos/features/home/ui/product_details_view.dart';
import 'package:marketos/features/home/ui/widgets/view_all/view_all_view.dart';
import 'package:marketos/features/land/ui/land.dart';
import 'package:marketos/features/profile/logic/cubits/change_address_cubit/change_Address_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/get_profile_cubit/get_profile_cubit.dart';
import 'package:marketos/features/profile/ui/map_view.dart';
import 'package:marketos/features/registration/logic/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:marketos/features/registration/logic/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:marketos/features/registration/ui/forms/log_in_form.dart';
import 'package:marketos/features/registration/ui/forms/sign_in_form.dart';
import 'package:marketos/features/splash/ui/splash_view.dart';

class AppRoutingManager {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutingConstants.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoutingConstants.signIn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<SignInCubit>(),
            child: const SignInForm(),
          ),
        );
      case AppRoutingConstants.logIn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<LogInCubit>(),
            child: const LoginForm(),
          ),
        );
      case AppRoutingConstants.land:
        return MaterialPageRoute(builder: (_) => const Land());
      case AppRoutingConstants.viewAll:
        var args = settings.arguments as ViewAllModel;
        return MaterialPageRoute(
            builder: (_) => ViewAllView(
                  viewAllModel: args,
                ));
      case AppRoutingConstants.productDetails:
        var args = settings.arguments as HomeProductEntity;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CheckProductCubit>()
                  ..checkProduct(
                    productId: args.productID,
                  ),
              ),
              BlocProvider(create: (context) => getIt<AddToCartCubit>()),
              BlocProvider(create: (context) => getIt<RemoveFromCartCubit>()),
            ],
            child: ProductDetailsView(
              product: args,
            ),
          ),
        );

      case AppRoutingConstants.paymentMethods:
        var args = settings.arguments as List<PaymentMethodEntity>;
        return MaterialPageRoute(builder: (BuildContext context) {
          return PaymentMethodsView(
            methods: args,
          );
        });

      case AppRoutingConstants.map:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<ChangeAddressCubit>()),
              BlocProvider(create: (context) => getIt<GetProfileCubit>()),
            ],
            child: const MapView(),
          ),
        );
      default:
        return null;
    }
  }
}
