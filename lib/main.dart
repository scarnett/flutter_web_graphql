import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_graphql/app.dart';
import 'package:flutter_web_graphql/bloc/app_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
