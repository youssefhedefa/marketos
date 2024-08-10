import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/core/routing/routing_manager.dart';

class Marketos extends StatelessWidget {
  const Marketos({super.key, required this.appRoutingManager});

  final AppRoutingManager appRoutingManager;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(_,child) => MaterialApp(
        title: 'Marketos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColorHelper.primaryColor),
          useMaterial3: true,
        ),
        onGenerateRoute: appRoutingManager.onGenerateRoute,
        initialRoute: AppRoutingConstants.land,
        // home:const Land(),
        // home:const ProductDetailsView(),
      ),
    );
  }
}