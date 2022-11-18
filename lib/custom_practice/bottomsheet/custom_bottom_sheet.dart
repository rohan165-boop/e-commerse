import 'package:ecommerse/constants/image_constants.dart';
import 'package:ecommerse/custom_practice/bottomsheet/widget/bottom_sheet_transition.dart';
import 'package:flutter/material.dart';

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Bottom Sheet"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        BottomSheetImage.bottomSheet9,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const BottomSheetTransition(),
          ],
        ),
      ),
    );
  }
}
