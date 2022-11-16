import 'package:ecommerse/constants/image_constants.dart';
import 'package:flutter/material.dart';

class PR extends StatefulWidget {
  const PR({super.key});

  @override
  State<PR> createState() => _PRState();
}

class _PRState extends State<PR> {
  Offset offset = Offset.zero;

  void _slideUp() {
    setState(() => offset -= const Offset(0, 0.5));
  }

  void _slideDown() {
    setState(() => offset += const Offset(0, 0.5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PR"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _slideUp();
            },
            child: const Text('Slide up'),
          ),
          ElevatedButton(
            onPressed: _slideDown,
            child: const Text('Slide down'),
          ),
          Padding(
            padding: const EdgeInsets.all(100),
            child: AnimatedSlide(
              offset: offset,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Image.asset(
                ImageConstants.steve,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
