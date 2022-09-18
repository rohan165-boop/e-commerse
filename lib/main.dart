import 'package:ecommerse/app/route.dart';
import 'package:ecommerse/app/route_handler.dart';
import 'package:ecommerse/custom_ticket_ui/ticket_homepage.dart';
import 'package:ecommerse/pages/home.dart';
import 'package:ecommerse/practice/demo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "e-Commerse",
//       navigatorKey: AppSettings.navigatorKey,
//       onGenerateRoute: RouteHandler.generateRoute,
//       initialRoute: AppRoute.homeRoute,
//     // home: TravelCardDemo(),
//     );
//   }
// }

// class AppSettings{
//   static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// }

// Coustom UI MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      title: 'Buy Tickets',
      home: const CustomTicketHome(),
    );
  }
}