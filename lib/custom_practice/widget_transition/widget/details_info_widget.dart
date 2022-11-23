import 'package:ecommerse/custom_practice/widget_transition/model/hero_tags.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/location.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/custom_hero_widget.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/stars_widget.dart';
import 'package:flutter/material.dart';

class DetailedInfoWidget extends StatelessWidget {
  final LocationModel location;

  const DetailedInfoWidget({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeroWidget(
              tag: HeroTag.addressLine1(location),
              child: Text(location.addressLine1),
            ),
            const SizedBox(height: 8),
            CustomHeroWidget(
              tag: HeroTag.addressLine2(location),
              child: Text(location.addressLine2),
            ),
            const SizedBox(height: 8),
            CustomHeroWidget(
              tag: HeroTag.stars(location),
              child: StarsWidget(stars: location.starRating),
            ),
          ],
        ),
      );
}
