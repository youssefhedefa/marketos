import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/di/di.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/land/ui/land.dart';
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
      case AppRoutingConstants.home:
        return MaterialPageRoute(builder: (_) => const Land());
      default:
        return null;
    }
  }
}
