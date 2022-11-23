import 'package:flutter/material.dart';

class CustomHeroWidget extends StatelessWidget {
  const CustomHeroWidget({
    Key? key,
    required this.tag,
    required this.child,
  }) : super(key: key);

  final String tag;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(type: MaterialType.transparency, child: child),
    );
  }
}
