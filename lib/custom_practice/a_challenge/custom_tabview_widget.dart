import 'package:animations/animations.dart';
import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/custom_practice/a_challenge/widgets/container_detail_page.dart';
import 'package:flutter/material.dart';

class CustomTabViewWidget extends StatelessWidget {
  const CustomTabViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ContainerTransitionType containerTransitionType =
        ContainerTransitionType.fade;
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
        OpenContainer(
          transitionType: containerTransitionType,
          transitionDuration: const Duration(milliseconds: 600),
          closedElevation: 0,
          closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
              ),
              side: BorderSide(color: Colors.white, width: 1)),
          closedColor: AppColors.appPink,
          openBuilder: (BuildContext context, _) => const ContainerDetailPage(),
          closedBuilder: (BuildContext context, _) => Container(
            height: 330,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
              ),
              color: AppColors.appPink,
            ),
          ),
        ),
      ],
    );
  }
}
