import 'package:flutter/material.dart';
import 'package:marketos/features/land/ui/land.dart';
import 'package:marketos/core/routing/routing_manager.dart';

class Marketos extends StatelessWidget {
  const Marketos({super.key, required this.appRoutingManager});

  final AppRoutingManager appRoutingManager;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // onGenerateRoute: appRoutingManager.onGenerateRoute,
      // initialRoute: AppRoutingConstants.splash,
      home:const Land(),
    );
  }
}