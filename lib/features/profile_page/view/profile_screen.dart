import 'package:ecommerse/constants/image_constants.dart';
import 'package:ecommerse/widgets/custom_app_bar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        _onScroll();
      });
    super.initState();
  }

  double _scrolloffset = 0.0;

  void _onScroll() {
    setState(() {
      _scrolloffset = _scrollController.offset;
    });
  }

  //layers speeds
  double _layer1speed = 0.5;
  double _layer2speed = 0.45;
  double _layer3speed = 0.40;
  double _layer4speed = 0.3;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var layoutHeight = screensize.height * 3;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Profile",
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 66, 240, 210),
                Color.fromARGB(255, 253, 244, 193)
              ]),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: _layer1speed * _scrolloffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset(SVGConstants.mountainslayer4),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(SVGConstants.mountainslayer2),
            ),
            Positioned(
              bottom: -10,
              left: 0,
              right: 0,
              child: SvgPicture.asset(SVGConstants.treelayer),
            ),
            Positioned(
              bottom: -60,
              left: 0,
              right: 0,
              child: SvgPicture.asset(SVGConstants.layer1),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  height: layoutHeight,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
