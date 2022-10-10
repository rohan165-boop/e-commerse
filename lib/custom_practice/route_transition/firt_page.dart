import 'package:ecommerse/custom_practice/route_transition/custom_page_route.dart';
import 'package:ecommerse/custom_practice/route_transition/sec_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("First page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(CustomRoute(child:const SecendPage()));
              },
              child: const Text("Sec page"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Third page"),
            ),
          ],
        ),
      ),
    );
  }
}
