import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget child;

  CustomRoute({required this.child})
      : super(
        transitionDuration:const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: animation,
        child: child,
      );
}
