import 'package:animations/animations.dart';
import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/custom_practice/route_transition/sec_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final ContainerTransitionType _containerTransitionType =
      ContainerTransitionType.fade;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First page"),
      ),
      body: Center(
        child: OpenContainerWidget(
            containerTransitionType: _containerTransitionType),
      ),
    );
  }
}

class OpenContainerWidget extends StatelessWidget {
  const OpenContainerWidget({
    Key? key,
    required ContainerTransitionType containerTransitionType,
  })  : _containerTransitionType = containerTransitionType,
        super(key: key);

  final ContainerTransitionType _containerTransitionType;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: _containerTransitionType,
      transitionDuration: const Duration(seconds: 2),
      closedElevation: 0,
      closedShape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1)),
      closedColor: AppColors.appPink,
      openBuilder: (BuildContext context, _) => const SecendPage(),
      closedBuilder: (BuildContext context, _) => Container(
        height: 100,
        width: double.infinity,
        color: AppColors.appPink,
      ),
    );
  }
}
