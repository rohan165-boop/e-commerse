import 'package:ecommerse/custom_ticket_ui/ticket_homepage.dart';
import 'package:ecommerse/flight_survay/flight_survay.dart';
import 'package:ecommerse/piano_tile/piano_home.dart';
import 'package:ecommerse/route_transition/firt_page.dart';
import 'package:ecommerse/sy_expedition_travel_challenge/main_page.dart';
import 'package:ecommerse/ui_chalange/ui_home.dart';
import 'package:ecommerse/widgets/custom_app_bar_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Zero To Unicorn",
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
          ],
        ));
  }
}
