
import 'dart:math';

import 'package:ecommerse/custom_practice/weather/assets_path.dart';
import 'package:flutter/material.dart';

class MoonWidget extends AnimatedWidget {
  const MoonWidget({Key? key, required Animation<Offset> listenable})
      : super(key: key, listenable: listenable);

  // Cast the Listenable to an Animation<Offset> object
  Animation<Offset> get _animation => listenable as Animation<Offset>;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final minSize = min(constraints.maxWidth, constraints.maxHeight);
      final moonSize = minSize / 2.0;
      return Transform.translate(
        offset: _animation.value,
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: Colors.white,
                spreadRadius: moonSize * 0.5,
                blurRadius: moonSize * 4)
          ]),
          child: Image.asset(
            AssetPath.moon,
            width: moonSize,
            height: moonSize,
          ),
        ),
      );
    });
  }
}