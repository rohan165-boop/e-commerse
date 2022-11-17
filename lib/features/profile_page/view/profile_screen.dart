import 'dart:developer';

import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ScrollController _scrollController;
  ValueNotifier<bool> isSunset = ValueNotifier(false);

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        _onScroll();
      })
      ..addListener(() {
        if (_scrollController.position.pixels >= 1000) {
          isSunset.value = true;
        } else if (_scrollController.position.pixels <= 10) {
          isSunset.value = false;
        }
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
  final double _layer1speed = 0.5;
  final double _layer2speed = 0.45;
  final double _layer3speed = 0.42;
  final double _layer4speed = 0.375;
  final double _sunspeed = 0.25;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var layoutHeight = screensize.height * 3;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.skycolor,
                AppColors.suncolor,
                AppColors.sunrise
              ]),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: (screensize.height * 0.6),
              left: screensize.width * 0.5,
              right: 0,
              child: Image.asset(GardenImage.cloud),
            ),
            Positioned(
              bottom: (screensize.height * 0.5),
              left: 0,
              right: screensize.width * 0.5,
              child: Image.asset(GardenImage.cloud),
            ),
            Positioned(
              bottom: (screensize.height * 0.18) + (_sunspeed * _scrolloffset),
              left: 0,
              right: 190,
              child: ValueListenableBuilder<bool>(
                  valueListenable: isSunset,
                  builder: (context, value, _) {
                    return SvgPicture.asset(
                      SVGConstants.sun,
                      color: value ? AppColors.sun1 : AppColors.sun,
                    );
                  }),
            ),
            Positioned(
              bottom: _layer4speed * _scrolloffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset(SVGConstants.mountainslayer4),
            ),
            Positioned(
              bottom: _layer3speed * _scrolloffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset(SVGConstants.mountainslayer2),
            ),
            Positioned(
              bottom: -10 + _layer2speed * _scrolloffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset(SVGConstants.treelayer),
            ),
            Positioned(
              bottom: -60 + _layer1speed * _scrolloffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset(SVGConstants.layer1),
            ),
            Positioned(
              top: (screensize.height - 62) +
                  (_layer1speed * _scrolloffset * -1),
              left: 0,
              right: 0,
              height: screensize.height,
              child: Container(
                color: AppColors.appBlack,
                alignment: Alignment.topCenter,
                child: ValueListenableBuilder<bool>(
                    valueListenable: isSunset,
                    builder: (context, value, _) {
                      return Text(
                        value ? "Parallax SunRise" : "Parallax Sunset",
                        style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      );
                    }),
              ),
            ),
            // scroll view
            Positioned.fill(
              child: SingleChildScrollView(
                reverse: false,
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
