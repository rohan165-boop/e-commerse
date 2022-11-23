import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/hero_tags.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/location.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/custom_hero_widget.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/details_info_widget.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/lat_log_widget.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/review_widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final LocationModel location;
  final Animation<double> animation;

  const DetailPage({
    required this.location,
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('INTERESTS'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: Navigator.of(context).pop,
            ),
            const SizedBox(width: 10)
          ],
          leading: const Icon(Icons.search_outlined),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox.expand(
                    child: CustomHeroWidget(
                      tag: HeroTag.image(location.urlImage),
                      child: Image.asset(location.urlImage, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: LatLongWidget(location: location),
                  ),
                ],
              ),
            ),
            DetailedInfoWidget(location: location),
            Expanded(
              flex: 5,
              child: ReviewsWidget(location: location, animation: animation),
            ),
          ],
        ),
      );
}
