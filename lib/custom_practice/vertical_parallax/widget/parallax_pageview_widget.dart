// ignore_for_file: library_private_types_in_public_api

import 'package:ecommerse/custom_practice/vertical_parallax/widget/vertical_parallax_container_widget.dart';
import 'package:flutter/material.dart';

class ParallaxPageView extends StatefulWidget {
  const ParallaxPageView({
    Key? key,
    required PageController controller,
    required this.offset,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;
  final double offset;

  @override
  _ParallaxPageViewState createState() => _ParallaxPageViewState();
}

class _ParallaxPageViewState extends State<ParallaxPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      controller: widget._controller,
      children: [
        VerticalParallaxContainerWidget(
          index: '0',
          offset: widget.offset,
          i: 0.0,
          text: 'Apex Legends',
        ),
        VerticalParallaxContainerWidget(
          index: '1',
          offset: widget.offset,
          i: 1.0,
          text: 'W W 13',
        ),
        VerticalParallaxContainerWidget(
          index: '2',
          offset: widget.offset,
          i: 2.0,
          text: 'Sacred Games',
        ),
        VerticalParallaxContainerWidget(
          index: '3',
          offset: widget.offset,
          i: 3.0,
          text: 'Farcry 5',
        ),
        VerticalParallaxContainerWidget(
          index: '4',
          offset: widget.offset,
          i: 4.0,
          text: 'Just Cause 3',
        ),
        VerticalParallaxContainerWidget(
          index: '5',
          offset: widget.offset,
          i: 5.0,
          text: 'Deadpool',
        ),
        VerticalParallaxContainerWidget(
          index: '6',
          offset: widget.offset,
          i: 6.0,
          text: 'Terminator Genesis',
        ),
        VerticalParallaxContainerWidget(
          index: '7',
          offset: widget.offset,
          i: 7.0,
          text: 'Fortnite',
        ),
        VerticalParallaxContainerWidget(
          index: '8',
          offset: widget.offset,
          i: 8.0,
          text: 'Uncharted 4',
        ),
        VerticalParallaxContainerWidget(
          index: '9',
          offset: widget.offset,
          i: 9.0,
          text: 'Game of Thrones',
        ),
        VerticalParallaxContainerWidget(
          index: '10',
          offset: widget.offset,
          i: 10.0,
          text: 'Crysis',
        ),
      ],
    );
  }
}
