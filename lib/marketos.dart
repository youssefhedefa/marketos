import 'package:flutter/material.dart';

class Marketos extends StatelessWidget {
  const Marketos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(),
    );
  }
}