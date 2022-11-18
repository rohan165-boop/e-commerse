import 'package:ecommerse/custom_practice/custom_painting/custom_dart.dart';
import 'package:flutter/material.dart';

class CustomRowParallaxWidget extends StatefulWidget {
  const CustomRowParallaxWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomRowParallaxWidget> createState() =>
      _CustomRowParallaxWidgetState();
}

class _CustomRowParallaxWidgetState extends State<CustomRowParallaxWidget> {
  PageController? pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController!.addListener(() {
      setState(() {
        pageOffset = pageController!.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.only(bottom: 30),
      child: PageView.builder(
        itemCount: paintings.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Transform.scale(
            scale: 1,
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      paintings[index].image,
                      height: 370,
                      fit: BoxFit.cover,
                      alignment: Alignment(-pageOffset.abs() + index, 0),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 20,
                    right: 10,
                    child: Text(
                      paintings[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
