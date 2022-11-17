import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/custom_practice/a_challenge/custom_tab_bar_widget.dart';
import 'package:ecommerse/custom_practice/a_challenge/custom_tabview_widget.dart';
import 'package:flutter/material.dart';

class AChallengeHomePage extends StatelessWidget {
  const AChallengeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("A-Challenge"),
        ),
        body: Stack(
          children: const [
            TabBarView(
              children: [
                CustomTabViewWidget(),
                CustomTabViewWidget(),
                CustomTabViewWidget(),
                CustomTabViewWidget(),
                CustomTabViewWidget(),
                CustomTabViewWidget(),
              ],
            ),
            CustomTabBarWidget()
          ],
        ),
      ),
    );
  }
}
