// ignore_for_file: library_private_types_in_public_api

import 'package:ecommerse/custom_practice/widget_transition/detail_page.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/location.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/expanded_content_widget.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/image_widget.dart';
import 'package:flutter/material.dart';

class CustomLocationWidget extends StatefulWidget {
  final LocationModel location;

  const CustomLocationWidget({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  _CustomLocationWidgetState createState() => _CustomLocationWidgetState();
}

class _CustomLocationWidgetState extends State<CustomLocationWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? 25 : 100,
            width: isExpanded ? size.width * 0.78 : size.width * 0.7,
            height: isExpanded ? size.height * 0.61 : size.height * 0.5,
            child: ExpandedContentWidget(location: widget.location),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? 150 : 100,
            child: GestureDetector(
              onPanUpdate: onPanUpdate,
              onTap: openDetailPage,
              child: CustomImageWidget(location: widget.location),
            ),
          ),
        ],
      ),
    );
  }

  void openDetailPage() {
    if (!isExpanded) {
      setState(() {
        isExpanded = true;
      });
      return;
    }
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5),
          );

          return FadeTransition(
            opacity: curvedAnimation,
            child: DetailPage(location: widget.location, animation: animation),
          );
        },
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
