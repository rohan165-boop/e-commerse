import 'package:flutter/material.dart';

class AnimatedPlaneIcon extends AnimatedWidget {
  const AnimatedPlaneIcon({Key? key, required Animation<dynamic> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<dynamic> animation = super.listenable as Animation<dynamic> ;
    return Icon(
      Icons.airplanemode_active,
      color: Colors.red,
      size: animation.value,
    );
  }
}