import 'package:flutter/material.dart';
import 'package:marketos/features/splash/ui/splash_view.dart';

class Marketos extends StatelessWidget {
  const Marketos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}