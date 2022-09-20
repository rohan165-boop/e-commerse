// ignore_for_file: dead_code

import 'package:ecommerse/drawer_3d/custom_drawer.dart';
import 'package:ecommerse/drawer_3d/custom_drawer_gitar.dart';
import 'package:ecommerse/drawer_3d/drawer_home.dart';
import 'package:ecommerse/flight_survay/flight_survay.dart';
import 'package:ecommerse/ui_chalange/ui_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// for e-commerse app
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
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'SF Pro Display'),
//       title: 'Buy Tickets',
//       home: const CustomTicketHome(),
//     );
//   }
// }

// route transition
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'SF Pro Display'),
//       title: 'Buy Tickets',
//       home: const FirstPage(),
//     );
//   }
// }

// sy_expedition_travel
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor: mainBlack,
//       ),
//       home: const MainPage(),
//     );
//   }
// }

// Flight survay
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
//       home: const FlightsStepper(),
//     );
//   }
// }

// 3d drawer
// class MyApp extends StatelessWidget implements PreferredSizeWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     bool flip = false;
//    AppBar appBar = flip
//         ? AppBar()
//         : AppBar(
//             leading: Builder(
//               builder: (context) {
//                 return IconButton(
//                   icon:const Icon(Icons.menu),
//                   onPressed: () => CustomDrawer.of(context)!.open(),
//                 );
//               },
//             ),
//             title: const Text('Hello Flutter Europe'),
//           );
//     Widget child = DrawerHome3D(appBar: appBar);
//     if (flip) {
//       child = CustomGuitarDrawer(child: child);
//     } else {
//       child = CustomDrawer(child: child);
//     }
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: child,
//     );
//   }
  
//   @override
//   Size get preferredSize => const Size(double.infinity, 50.0);
// }

// ui chalange folder
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flight Search',
      theme:  ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const UIHomePage(),
    );
  }
}
