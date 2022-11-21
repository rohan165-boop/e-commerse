import 'package:ecommerse/custom_practice/vertical_parallax/widget/custom_top_bar.dart';
import 'package:ecommerse/custom_practice/vertical_parallax/widget/parallax_pageview_widget.dart';
import 'package:flutter/material.dart';

class VerticalParallaxHomeScreen extends StatefulWidget {
  const VerticalParallaxHomeScreen({super.key});

  @override
  State<VerticalParallaxHomeScreen> createState() =>
      _VerticalParallaxHomeScreenState();
}

class _VerticalParallaxHomeScreenState
    extends State<VerticalParallaxHomeScreen> {
  late PageController _controller;
  double? offset = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.6);
    _controller.addListener(() {
      setState(() {
        offset = _controller.page;
        //print(offset);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vertical Parallax"),
      ),
      body: Stack(
        children: [
          ParallaxPageView(
            controller: _controller,
            offset: offset!,
          ),
          const TopBar()
        ],
      ),
    );
  }
}
