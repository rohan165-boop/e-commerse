import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedConatinerScreen extends StatefulWidget {
  const AnimatedConatinerScreen({super.key});

  @override
  State<AnimatedConatinerScreen> createState() => _AnimatedConatinerScreenState();
}

class _AnimatedConatinerScreenState extends State<AnimatedConatinerScreen> {

   double _width = 50;
   double _height = 50;
   Color _color = Colors.green;
   BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Conatiner"),
      ),

      body: Center(
        child: InkWell(
          onTap: () {
            // Use setState to rebuild the widget with new values.
            setState(() {
              // Create a random number generator.
              final random = Random();

              // Generate a random width and height.
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              // Generate a random color.
              _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );

              // Generate a random border radius.
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius
            ),
             duration: const Duration(seconds: 1),
             curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}