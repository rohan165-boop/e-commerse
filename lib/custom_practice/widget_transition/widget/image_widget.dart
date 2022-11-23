import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/hero_tags.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/location.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/custom_hero_widget.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/lat_log_widget.dart';
import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final LocationModel location;

  const CustomImageWidget({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.appBlack.withOpacity(0.12),
                blurRadius: 2,
                spreadRadius: 1),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            buildImage(),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTopText(),
                  LatLongWidget(location: location),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() => SizedBox.expand(
        child: CustomHeroWidget(
          tag: HeroTag.image(location.urlImage),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.asset(location.urlImage, fit: BoxFit.cover),
          ),
        ),
      );

  Widget buildTopText() => Text(
        location.name,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );
}
