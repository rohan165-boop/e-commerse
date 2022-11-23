import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/hero_tags.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/location.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/custom_hero_widget.dart';
import 'package:flutter/material.dart';

class LatLongWidget extends StatelessWidget {
  final LocationModel location;

  const LatLongWidget({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomHeroWidget(
            tag: HeroTag.latitude(location),
            child: Text(
              location.latitude,
              style: TextStyle(color: AppColors.white.withOpacity(0.7)),
            ),
          ),
          CustomHeroWidget(
            tag: HeroTag.icon(location),
            child: Icon(
              location.icon,
              color: AppColors.white.withOpacity(0.7),
            ),
          ),
          CustomHeroWidget(
            tag: HeroTag.logitude(location),
            child: Text(
              location.longitude,
              style: TextStyle(color: AppColors.white.withOpacity(0.7)),
            ),
          )
        ],
      );
}
