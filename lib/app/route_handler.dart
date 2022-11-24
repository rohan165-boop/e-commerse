import 'package:ecommerse/app/route.dart';
import 'package:ecommerse/custom_practice/a_challenge/a_challenge.dart';
import 'package:ecommerse/custom_practice/bottomsheet/custom_bottom_sheet.dart';
import 'package:ecommerse/custom_practice/custom_painting/custom_painting_parallax.dart';
import 'package:ecommerse/custom_practice/custom_ticket_ui/ticket_homepage.dart';
import 'package:ecommerse/custom_practice/evening_sunset/evening.dart';
import 'package:ecommerse/custom_practice/flight_survey/flight_survay.dart';
import 'package:ecommerse/custom_practice/guitar_drawer_3d/guitar_drawer_3d.dart';
import 'package:ecommerse/custom_practice/image_sequence/dreawe_2d.dart';
import 'package:ecommerse/custom_practice/image_sequence/image_sequence_screen.dart';
import 'package:ecommerse/custom_practice/piano_tile/piano_home.dart';
import 'package:ecommerse/custom_practice/qr_code/qr_home_screen.dart';
import 'package:ecommerse/custom_practice/qr_code/widget/qr_create_screen.dart';
import 'package:ecommerse/custom_practice/qr_code/widget/qr_scan_screen.dart';
import 'package:ecommerse/custom_practice/route_transition/firt_page.dart';
import 'package:ecommerse/custom_practice/snake_game/game.dart';
import 'package:ecommerse/custom_practice/sy_expedition_travel_challenge/main_page.dart';
import 'package:ecommerse/custom_practice/widget_transition/transition_screen.dart';
import 'package:ecommerse/custom_practice/ui_challenge/ui_home.dart';
import 'package:ecommerse/custom_practice/vertical_parallax/vertical_parallax.dart';
import 'package:ecommerse/custom_practice/weather/ui/weather_home.dart';
import 'package:ecommerse/features/wish_list/view/wish_list_screen.dart';
import 'package:ecommerse/pages/home.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // var arguments = settings.arguments;

    switch (settings.name) {
      case AppRoute.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      case AppRoute.wishListScreeenRoute:
        return MaterialPageRoute(
          builder: (context) => const WishListScreen(),
        );

      case AppRoute.ticketRoute:
        return MaterialPageRoute(
          builder: (context) => const CustomTicketHome(),
        );

      case AppRoute.pageRoute:
        return MaterialPageRoute(
          builder: (context) => const FirstPage(),
        );

      case AppRoute.sytravelRoute:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );

      case AppRoute.flightsurveyRoute:
        return MaterialPageRoute(
          builder: (context) => const FlightsStepper(),
        );

      case AppRoute.uichallengeRoute:
        return MaterialPageRoute(
          builder: (context) => const UIHomePage(),
        );

      case AppRoute.pianoRoute:
        return MaterialPageRoute(
          builder: (context) => const PinoHomeScreen(),
        );

      case AppRoute.weatherRoute:
        return MaterialPageRoute(
          builder: (context) => LayoutBuilder(builder: (context, constraints) {
            return WeatherHomeScreen(width: constraints.maxWidth);
          }),
        );

      case AppRoute.snakeRoute:
        return MaterialPageRoute(
          builder: (context) => const GamePage(),
        );

      case AppRoute.achallengeRoute:
        return MaterialPageRoute(
          builder: (context) => const AChallengeHomePage(),
        );

      case AppRoute.eveningRoute:
        return MaterialPageRoute(
          builder: (context) => const EveningScreen(),
        );

      case AppRoute.custombottomsheetRoute:
        return MaterialPageRoute(
          builder: (context) => const CustomButtomSheet(),
        );

      case AppRoute.parallaxpaintingRoute:
        return MaterialPageRoute(
          builder: (context) => const CustomPaintingParallax(),
        );

      case AppRoute.verticalparallaxRoute:
        return MaterialPageRoute(
          builder: (context) => const VerticalParallaxHomeScreen(),
        );

      case AppRoute.guitar3dRoute:
        return MaterialPageRoute(
          builder: (context) => const GuitarDrawer3dHomeScreen(),
        );

      case AppRoute.imagesequenceRoute:
        return MaterialPageRoute(
          builder: (context) => const ImageSequenceHomeScreen(),
        );

      case AppRoute.drawer3dRoute:
        return MaterialPageRoute(
          builder: (context) => const Drawer2dHomeScreen(),
        );

      case AppRoute.transitionRoute:
        return MaterialPageRoute(
          builder: (context) => const TransitionHomeScreen(),
        );

      case AppRoute.qrhomescreenRoute:
        return MaterialPageRoute(
          builder: (context) => const QrHomeScreen(),
        );

      case AppRoute.qrcreatecreenRoute:
        return MaterialPageRoute(
          builder: (context) => const QrCodeCreatePage(),
        );

      case AppRoute.qrscancreenRoute:
        return MaterialPageRoute(
          builder: (context) => const QrCodeScanScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
    }
  }
}
