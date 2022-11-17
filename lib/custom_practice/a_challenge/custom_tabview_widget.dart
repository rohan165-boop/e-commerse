import 'package:ecommerse/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTabViewWidget extends StatelessWidget {
  const CustomTabViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 400,
            width: double.infinity,
            color: AppColors.applightvoilate2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Container(
            height: 430,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
              ),
              color: AppColors.appvoilate,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Container(
            height: 350,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
              ),
              color: AppColors.appGrey,
            ),
          ),
        ),
        Container(
          height: 330,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
            ),
            color: AppColors.appPink,
          ),
        ),
      ],
    );
  }
}
