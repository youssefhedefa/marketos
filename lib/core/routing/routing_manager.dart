import 'package:flutter/material.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/registration/ui/sign_in_form.dart';
import 'package:marketos/features/splash/ui/splash_view.dart';
class AppRoutingManager{
  Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoutingConstants.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoutingConstants.signIn:
        return MaterialPageRoute(builder: (_) => const SignInForm());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}