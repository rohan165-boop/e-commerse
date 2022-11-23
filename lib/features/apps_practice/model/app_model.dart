import 'package:ecommerse/app/route.dart';
import 'package:ecommerse/constants/image_constants.dart';
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
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.ticketRoute);
    },
    image: ImageConstants.efe,
  ),
  AppModel(
    title: "Route",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.pageRoute);
    },
    image: ImageConstants.rodion,
  ),
  AppModel(
    title: "Sy_Travel",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.sytravelRoute);
    },
    image: ImageConstants.steve,
  ),
  AppModel(
    title: "Flight Survey",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.flightsurveyRoute);
    },
    image: ImageConstants.efe,
  ),
  AppModel(
    title: "UI Challenge",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.uichallengeRoute);
    },
    image: ImageConstants.rodion,
  ),
  AppModel(
    title: "Piano",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.pianoRoute);
    },
    image: ImageConstants.steve,
  ),
  AppModel(
    title: "Weather",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.weatherRoute);
    },
    image: ImageConstants.efe,
  ),
  AppModel(
    title: "Snake Game",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.snakeRoute);
    },
    image: ImageConstants.rodion,
  ),
  AppModel(
    title: "A-Challenge",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.achallengeRoute);
    },
    image: ImageConstants.steve,
  ),
  AppModel(
    title: "Evening",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.eveningRoute);
    },
    image: ImageConstants.steve,
  ),
  AppModel(
    title: "CustomBottomSheet",
    press: () {
      Navigator.pushNamed(AppSettings.navigatorKey.currentContext!,
          AppRoute.custombottomsheetRoute);
    },
    image: BottomSheetImage.bottomSheet9,
  ),
  AppModel(
    title: "Parallax Painting",
    press: () {
      Navigator.pushNamed(AppSettings.navigatorKey.currentContext!,
          AppRoute.parallaxpaintingRoute);
    },
    image: PaintingImage.painting,
  ),
  AppModel(
    title: "Vertical Parallax",
    press: () {
      Navigator.pushNamed(AppSettings.navigatorKey.currentContext!,
          AppRoute.verticalparallaxRoute);
    },
    image: VerticalImage.v0,
  ),
  AppModel(
    title: "Guitar 3d Drawer",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.guitar3dRoute);
    },
    image: VerticalImage.v4,
  ),
  AppModel(
    title: "Image Sequence",
    press: () {
      Navigator.pushNamed(AppSettings.navigatorKey.currentContext!,
          AppRoute.imagesequenceRoute);
    },
    image: VerticalImage.v9,
  ),
  AppModel(
    title: "Drawer",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.drawer3dRoute);
    },
    image: VerticalImage.v5,
  ),
  AppModel(
    title: "Transition",
    press: () {
      Navigator.pushNamed(
          AppSettings.navigatorKey.currentContext!, AppRoute.TransitionRoute);
    },
    image: VerticalImage.v7,
  ),
];
