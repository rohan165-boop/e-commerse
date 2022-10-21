// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerse/widgets/custom_app_bar_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Zero To Unicorn",
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _showDialog(context);
              },
              child: const Text("allert")),
          Center(
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height / 4,
                width: 300,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF3383CD),
                      Color(0xFF11249F),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 200,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // Column(
      //   children: [
      //     SizedBox(
      //     child: CarouselSlider(
      //   options: CarouselOptions(
      //     aspectRatio: 1.5,
      //     viewportFraction: 0.9,
      //     enlargeStrategy: CenterPageEnlargeStrategy.height,
      //     enlargeCenterPage: true,
      //     scrollDirection: Axis.horizontal,
      //     // autoPlay: true,
      //   ),
      //   items: Category.categories.map((e) => HeroCarouselCaed(category: e,)).toList(),
      // )),
      //   ],
      // ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        titlePadding: const EdgeInsets.all(0.0),
        title: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text("Alert Dialog Box"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Content writing services"),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              child: const Text("Cancle"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              child: const Text("Submit"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ),
            Positioned(
              left: 115,
              bottom: 174,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green),
              ),
            ),
          ],
        ),
        // content:  Container(
        //   padding: const EdgeInsets.all(20),
        //   height: 100,
        //   width: double.infinity,
        //   child: const Text("You are awesome!")),
        // actions: <Widget>[
        //   ElevatedButton(
        //     child: const Text("OK"),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ],
      );
    },
  );
}

class MyClipper extends CustomClipper<Path> {
  // final double right;
  // final double holeRadius;
  // MyClipper({
  //   required this.right,
  //   required this.holeRadius,
  // });
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(size.width / 2, 0), radius: 29.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: 0.0));

    return path;

    //  final path = Path()
    //   ..moveTo(0, 0)
    //   ..lineTo(size.width  - holeRadius, 0.0)
    //   ..arcToPoint(
    //     Offset(size.width - right, 0),
    //     clockwise: false,
    //     radius: const Radius.circular(10),
    //   )
    //   ..lineTo(size.width, 0.0)
    //   ..lineTo(size.width , size.height )
    //   ..lineTo(size.width - right, size.height)
    //   ..arcToPoint(
    //     Offset(size.width - holeRadius, size.height),
    //     clockwise: true,
    //     radius: const Radius.circular(5),
    //   );
    //   path.lineTo(0.0, size.height);
    // path.close();
    // return path;

    // var path = Path();
    // path.lineTo(0, size.height-100);
    // path.quadraticBezierTo(size.width/10, size.height/10, size.width/7, size.height-100);
    // path.lineTo(size.width, size.height-100);
    // path.lineTo(size.width, 0);
    // path.close();
    // return path;

    // Path path = Path();
    // path.lineTo(0, size.height);
    // var curXPos = 0.0;
    // var curYPos = size.height;
    // var increment = size.width / 1;
    // while (curXPos < size.width) {
    //   curXPos += increment;
    //   path.arcToPoint(Offset(curXPos, curYPos), radius: const Radius.circular(2));
    // }
    //  path.lineTo(size.width, 0);
    //  return path;

    // arck model

    // var path = Path();
    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(
    //     size.width / 3, size.height / 3, size.width , size.height / 5);
    // path.lineTo(size.width, 0);
    // path.close();
    // return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
