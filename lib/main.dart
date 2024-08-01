import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/components/bloc_observer.dart';
import 'package:marketos/core/di/di.dart';
import 'package:marketos/core/routing/routing_manager.dart';
import 'package:marketos/firebase_options.dart';
import 'package:marketos/marketos.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencyInjection();
  Bloc.observer = MyBlocObserver();
  runApp(Marketos(appRoutingManager: AppRoutingManager(),),);
}

