import 'package:ecommerse/widgets/custom_app_bar_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Zero To Unicorn",
      ),
      body: ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height / 4,
          width: double.infinity,
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
        ),

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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 3, size.height / 3, size.width , size.height / 5);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
