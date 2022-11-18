import 'package:ecommerse/custom_practice/route_transition/sec_page.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

const double fabSize = 56;

class CustomFABWidget extends StatelessWidget {
  final ContainerTransitionType transitionType;

  const CustomFABWidget({
    Key? key,
    required this.transitionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => OpenContainer(
        transitionDuration: const Duration(seconds: 2),
        openBuilder: (context, _) => const SecendPage(),
        closedShape: const CircleBorder(),
        closedColor: Theme.of(context).primaryColor,
        closedBuilder: (context, openContainer) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          height: fabSize,
          width: fabSize,
          child: const Icon(Icons.remove_red_eye, color: Colors.white),
        ),
      );
}
