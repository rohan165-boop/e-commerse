import 'package:flutter/material.dart';

class AirAsiaBar extends StatelessWidget {
  final double height;

  const AirAsiaBar({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red, Color(0xFFE64C85)],
            ),
          ),
          height: height,
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "AirAsia",
            style: TextStyle(
                fontFamily: 'NothingYouCouldDo', fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}