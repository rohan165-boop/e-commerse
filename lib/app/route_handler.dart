import 'package:ecommerse/app/route.dart';
import 'package:ecommerse/features/wish_list/view/wish_list_screen.dart';
import 'package:ecommerse/pages/home.dart';
import 'package:flutter/material.dart';

class RouteHandler{
  static Route<dynamic> generateRoute(RouteSettings settings){

    var arguments = settings.arguments;

    switch(settings.name) {
      case AppRoute.homeRoute:
      return MaterialPageRoute(builder: (context) => const Home(),);

      case AppRoute.wishListScreeenRoute:
      return MaterialPageRoute(builder: (context) => const WishListScreen(),);

      default:
     return MaterialPageRoute(builder: (context) => const Home(),);
    }
  }
}