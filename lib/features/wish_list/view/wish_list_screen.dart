import 'package:ecommerse/custom_practice/custom_ticket_ui/ticket_homepage.dart';
import 'package:ecommerse/custom_practice/flight_survey/flight_survay.dart';
import 'package:ecommerse/custom_practice/piano_tile/piano_home.dart';
import 'package:ecommerse/custom_practice/route_transition/firt_page.dart';
import 'package:ecommerse/custom_practice/snake_game/game.dart';
import 'package:ecommerse/custom_practice/sy_expedition_travel_challenge/main_page.dart';
import 'package:ecommerse/custom_practice/ui_challenge/ui_home.dart';
import 'package:ecommerse/custom_practice/weather/ui/weather_home.dart';
import 'package:ecommerse/widgets/custom_app_bar_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Wish List",
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoButton(
                color: Colors.cyan,
                child: const Text("Custom Ticket"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CustomTicketHome()));
                }),
            CupertinoButton(
                color: Colors.cyan,
                child: const Text("Route Transition"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FirstPage()));
                }),
            CupertinoButton(
                color: Colors.cyan,
                child: const Text("Sy_travel"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MainPage()));
                }),
            CupertinoButton(
                color: Colors.cyan,
                child: const Text("Flight Survay"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FlightsStepper()));
                }),
            CupertinoButton(
                color: Colors.cyan,
                child: const Text("Ui Chalange"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UIHomePage()));
                }),
            CupertinoButton(
                color: Colors.cyan,
                child: const Text("Piano"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PinoHomeScreen()));
                }),
            CupertinoButton(
                color: Colors.cyan,
                child: const Text("Weather"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        LayoutBuilder(builder: (context, constraints) {
                      // Use a LayoutBuilder to retrieve the current maxWidth of the screen
                      // HomePage will use it to keep things responsive
                      return WeatherHomeScreen(width: constraints.maxWidth);
                    }),
                  ));
                }),
            CupertinoButton(
                color: Colors.cyan,
                child: const Text("Snack Game"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GamePage()));
                }),
          ],
        ));
  }
}
