import 'package:ecommerse/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EveningParallaxScreen1 extends StatefulWidget {
  const EveningParallaxScreen1({super.key});

  @override
  State<EveningParallaxScreen1> createState() => _EveningParallaxScreen1State();
}

class _EveningParallaxScreen1State extends State<EveningParallaxScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Evening"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.orange, AppColors.water]),
          ),
        ));
  }
}
