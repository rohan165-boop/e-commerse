import 'package:ecommerse/constants/image_constants.dart';
import 'package:ecommerse/custom_practice/a_challenge/a_challenge.dart';
import 'package:ecommerse/custom_practice/custom_ticket_ui/ticket_homepage.dart';
import 'package:ecommerse/custom_practice/evening_sunset/evening.dart';
import 'package:ecommerse/custom_practice/flight_survey/flight_survay.dart';
import 'package:ecommerse/custom_practice/piano_tile/piano_home.dart';
import 'package:ecommerse/custom_practice/route_transition/firt_page.dart';
import 'package:ecommerse/custom_practice/snake_game.dart/game.dart';
import 'package:ecommerse/custom_practice/sy_expedition_travel_challenge/main_page.dart';
import 'package:ecommerse/custom_practice/ui_challenge/ui_home.dart';
import 'package:ecommerse/custom_practice/weather/ui/weather_home.dart';
import 'package:ecommerse/main.dart';
import 'package:flutter/material.dart';

class AppModel {
  final String title;
  final VoidCallback? press;
  final String image;
  const AppModel({required this.title, required this.image, this.press});
}

List<AppModel> appModel = [
  AppModel(
    title: "Ticket",
    press: () {
      Navigator.push(
        AppSettings.navigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => const CustomTicketHome(),
        ),
      );
    },
    image: ImageConstants.efe,
  ),
  AppModel(
    title: "Route",
    press: () {
      Navigator.push(
          AppSettings.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => FirstPage(),
          ));
    },
    image: ImageConstants.rodion,
  ),
  AppModel(
    title: "Sy_Travel",
    press: () {
      Navigator.push(
          AppSettings.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ));
    },
    image: ImageConstants.steve,
  ),
  AppModel(
    title: "Flight Survey",
    press: () {
      Navigator.push(
          AppSettings.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const FlightsStepper(),
          ));
    },
    image: ImageConstants.efe,
  ),
  AppModel(
    title: "UI Challenge",
    press: () {
      Navigator.push(
          AppSettings.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const UIHomePage(),
          ));
    },
    image: ImageConstants.rodion,
  ),
  AppModel(
    title: "Piano",
    press: () {
      Navigator.push(
          AppSettings.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const PinoHomeScreen(),
          ));
    },
    image: ImageConstants.steve,
  ),
  AppModel(
    title: "Weather",
    press: () {
      Navigator.push(
          AppSettings.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) =>
                LayoutBuilder(builder: (context, constraints) {
              return WeatherHomeScreen(width: constraints.maxWidth);
            }),
          ));
    },
    image: ImageConstants.efe,
  ),
  AppModel(
    title: "Snake Game",
    press: () {
      Navigator.push(
          AppSettings.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const GamePage(),
          ));
    },
    image: ImageConstants.rodion,
  ),
  AppModel(
    title: "A-Challenge",
    press: () {
      Navigator.push(
          AppSettings.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const AChallengeHomePage(),
          ));
    },
    image: ImageConstants.steve,
  ),
  AppModel(
    title: "Evening",
    press: () {
      Navigator.push(
          AppSettings.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const EveningScreen(),
          ));
    },
    image: ImageConstants.steve,
  ),
];
