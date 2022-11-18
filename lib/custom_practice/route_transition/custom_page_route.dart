import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget child;

  CustomRoute({required this.child})
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: animation,
        child: child,
      );
}

class SlideBottomUpRoute extends PageRouteBuilder {
  SlideBottomUpRoute(
      {required this.enterWidget,
      required this.oldWidget,
      RouteSettings? settings})
      : super(
          transitionDuration: const Duration(seconds: 1),
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => enterWidget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(0, 1),
                  ).animate(
                    CurvedAnimation(
                        parent: animation, curve: Curves.elasticInOut),
                  ),
                  child: oldWidget),
              SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn),
                  ),
                  child: enterWidget),
            ],
          ),
        );

  final Widget enterWidget;
  final Widget oldWidget;
}

class CustomContainerRoute extends PageRouteBuilder {
  final Widget child;
  CustomContainerRoute({required this.child})
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) => child);
}
