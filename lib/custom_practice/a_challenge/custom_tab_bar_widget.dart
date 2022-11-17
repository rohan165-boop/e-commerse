import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/custom_practice/a_challenge/widgets/custom_tab_widget.dart';
import 'package:flutter/material.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
        ),
        color: AppColors.white,
      ),
      child: TabBar(
        unselectedLabelColor: AppColors.grey,
        isScrollable: true,
        labelColor: AppColors.appBlack,
        indicatorColor: Colors.transparent,
        splashBorderRadius: BorderRadius.circular(40),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        tabs: const [
          CustomTabWidget(
            title: "you",
            icon: Icons.person,
          ),
          CustomTabWidget(
            title: "Trending",
            icon: Icons.trending_up,
          ),
          CustomTabWidget(
            title: "Health",
            icon: Icons.favorite_border_sharp,
          ),
          CustomTabWidget(
            title: "Music",
            icon: Icons.headset_sharp,
          ),
          CustomTabWidget(
            title: "Sport",
            icon: Icons.sports,
          ),
          CustomTabWidget(
            title: "About",
            icon: Icons.file_copy,
          ),
        ],
      ),
    );
  }
}
