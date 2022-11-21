// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/constants/image_constants.dart';
import 'package:ecommerse/features/home_page/view/widget/paralax_background.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double topEleven = 0;
  double topTen = 0;
  double topNine = 0;
  double topEight = 0;
  double topSeven = 0;
  double topSix = 0;
  double topFive = 0;
  double topFour = 0;
  double topThree = 0;
  double topTwo = 0;
  double topOne = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notif) {
          if (notif is ScrollUpdateNotification) {
            if (notif.scrollDelta == null) return true;
            setState(() {
              topEleven -= notif.scrollDelta! / 2.0;
              topTen -= notif.scrollDelta! / 1.9;
              topNine -= notif.scrollDelta! / 1.8;
              topEight -= notif.scrollDelta! / 1.7;
              topSeven -= notif.scrollDelta! / 1.6;
              topSix -= notif.scrollDelta! / 1.5;
              topFive -= notif.scrollDelta! / 1.4;
              topFour -= notif.scrollDelta! / 1.3;
              topThree -= notif.scrollDelta! / 1.2;
              topTwo -= notif.scrollDelta! / 1.2;
              topOne -= notif.scrollDelta! / 1;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            const SizedBox(
              height: 100,
            ),

            /// Paralax Background
            ParalaxBackground(
              top: topEleven,
              asset: GardenImage.garden11,
            ),
            ParalaxBackground(
              top: topTen,
              asset: GardenImage.garden10,
            ),
            ParalaxBackground(
              top: topNine,
              asset: GardenImage.garden9,
            ),
            ParalaxBackground(
              top: topEight,
              asset: GardenImage.garden8,
            ),
            ParalaxBackground(
              top: topSeven,
              asset: GardenImage.garden7,
            ),
            ParalaxBackground(
              top: topSix,
              asset: GardenImage.garden6,
            ),
            ParalaxBackground(
              top: topFive,
              asset: GardenImage.garden5,
            ),
            ParalaxBackground(
              top: topFour,
              asset: GardenImage.garden4,
            ),
            ParalaxBackground(
              top: topThree,
              asset: GardenImage.garden3,
            ),
            ParalaxBackground(
              top: topTwo,
              asset: GardenImage.garden2,
            ),
            ParalaxBackground(
              top: topOne,
              asset: GardenImage.garden1,
            ),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 350),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: AppColors.appBlack,
                        image: DecorationImage(
                            image: AssetImage(BottomSheetImage.bottomSheet9),
                            fit: BoxFit.cover)),
                    child: const Text(
                      "Parallax Effect",
                      style: TextStyle(
                          color: AppColors.water,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
