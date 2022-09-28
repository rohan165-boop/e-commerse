import 'dart:math';

import 'package:ecommerse/weather/assets_path.dart';
import 'package:ecommerse/weather/model/weather_type.dart';
import 'package:flutter/material.dart';

class CloudyWidget extends StatelessWidget {
  final WeatherType weatherType;

  const CloudyWidget({Key? key, required this.weatherType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder widget is handy to get the child's constraints
    return LayoutBuilder(builder: (context, constraints) {
      final minSize = min(constraints.maxWidth, constraints.maxHeight);
      // We use this minSize to make our UI more responsive

      return Stack(children: [
        Positioned.fill(
          child: Center(
            child: Padding(
                padding:
                    EdgeInsets.only(bottom: minSize / 10, right: minSize / 2),
                child: Image.asset(
                  AssetPath.cloud3,
                  width: minSize / 3.5,
                  height: minSize / 3.5,
                )),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Padding(
                padding:
                    EdgeInsets.only(bottom: minSize / 6, left: minSize / 2),
                child: Image.asset(
                  AssetPath.cloud2,
                  width: minSize / 3,
                  height: minSize / 3,
                )),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Image.asset(
              AssetPath.cloud1,
              width: minSize / 2,
              height: minSize / 2,
            ),
          ),
        ),
      ]);
    });
  }
}