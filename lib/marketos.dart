import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/features/home/ui/widgets/view_all/view_all_view.dart';
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // onGenerateRoute: appRoutingManager.onGenerateRoute,
        // initialRoute: AppRoutingConstants.splash,
        // home:const Land(),
        home:const ViewAllView(),
      ),
    );
  }
}