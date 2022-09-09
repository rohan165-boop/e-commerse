import 'package:ecommerse/app/route.dart';
import 'package:ecommerse/app/route_handler.dart';
import 'package:ecommerse/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "e-Commerse",
      navigatorKey: AppSettings.navigatorKey,
      onGenerateRoute: RouteHandler.generateRoute,
      initialRoute: AppRoute.homeRoute,
    );
  }
}

class AppSettings{
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}