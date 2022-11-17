import 'package:flutter/material.dart';

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
