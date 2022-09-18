//Takes a x,y or z rotation, in degrees, and rotates. Good for spins & 3d flip effects
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Rotation3d extends StatelessWidget {
  //Degrees to rads constant
  static const double degree2Radians = pi / 180;

  final Widget? child;
  final double? rotationX;
  final double? rotationY;
  final double? rotationZ;
  const Rotation3d({
    super.key,
     this.child,
     this.rotationX,
     this.rotationY,
     this.rotationZ,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(rotationX! * degree2Radians)
        ..rotateY(rotationY! * degree2Radians)
        ..rotateZ(rotationZ! * degree2Radians),
        child: child,
    );
  }
}
