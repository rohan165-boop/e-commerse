import 'package:flutter/material.dart';

class AnimatedDot extends AnimatedWidget {
  final Color color;
  static const double size = 24.0;

  const AnimatedDot({
    Key? key,
    required Animation<dynamic> animation,
    required this.color,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<dynamic> animation = super.listenable as Animation<dynamic>;
    return Positioned(
      top: animation.value,
      child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color:const Color(0xFFDDDDDD), width: 1.0)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          )),
    );
  }
}