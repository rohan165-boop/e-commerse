// ignore_for_file: library_private_types_in_public_api

import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/location.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/custom_location_widget.dart';
import 'package:flutter/material.dart';

class CustomLocationsWidget2 extends StatefulWidget {
  const CustomLocationsWidget2({super.key});

  @override
  _CustomLocationsWidget2State createState() => _CustomLocationsWidget2State();
}

class _CustomLocationsWidget2State extends State<CustomLocationsWidget2> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];

                return CustomLocationWidget(location: location);
              },
              onPageChanged: (index) => setState(() => pageIndex = index),
            ),
          ),
          Text(
            '${pageIndex + 1}/${locations.length}',
            style: TextStyle(color: AppColors.white.withOpacity(0.7)),
          ),
          const SizedBox(height: 12)
        ],
      );
}
