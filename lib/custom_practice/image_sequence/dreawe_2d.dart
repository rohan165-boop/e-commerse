import 'dart:math';

import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/constants/image_constants.dart';
import 'package:flutter/material.dart';

class Drawer2dHomeScreen extends StatefulWidget {
  const Drawer2dHomeScreen({super.key});

  @override
  State<Drawer2dHomeScreen> createState() => _Drawer2dHomeScreenState();
}

class _Drawer2dHomeScreenState extends State<Drawer2dHomeScreen> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.blue.shade400,
                  Colors.blue.shade800,
                ])),
          ),
          SafeArea(
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(VerticalImage.v9),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Roh AN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: const [
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            size: 30,
                            color: AppColors.white,
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            size: 30,
                            color: AppColors.white,
                          ),
                          title: Text(
                            "Profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.settings,
                            size: 30,
                            color: AppColors.white,
                          ),
                          title: Text(
                            "Setting",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            size: 30,
                            color: AppColors.white,
                          ),
                          title: Text(
                            "Log out",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 500),
            builder: ((context, value, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * value)
                  ..rotateY((pi / 6) * value),
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text("3d Drawer"),
                  ),
                  body: const Center(
                    child: Text("Swipe right to open the menu"),
                  ),
                ),
              );
            }),
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
            // onTap: () {
            //   setState(() {
            //     value == 0 ? value = 1 : value = 0;
            //   });
            // },
          )
        ],
      ),
    );
  }
}
