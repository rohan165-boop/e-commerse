import 'package:ecommerse/app/route.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.cyan.shade100,
              Colors.cyan.shade200,
              Colors.cyan.shade300,
              Colors.cyan.shade400,
              Colors.cyan.shade500,
            ]
          ),
          borderRadius: BorderRadius.circular(100)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.red.shade400),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.wishListScreeenRoute);
          },
          icon: const Icon(
            Icons.favorite,
            size: 35,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
