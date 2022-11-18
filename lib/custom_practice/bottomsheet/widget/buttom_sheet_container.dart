// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerse/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:ecommerse/custom_practice/bottomsheet/widget/model.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    Key? key,
    required this.bottomSheetModel,
    this.topMargin,
    this.leftMargin,
    this.imgSize,
    this.isCompleted,
  }) : super(key: key);

  final BottomSheetModel bottomSheetModel;
  final double? topMargin;
  final double? leftMargin;
  final double? imgSize;
  final bool? isCompleted;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: leftMargin,
      right: 0,
      child: Row(
        children: [
          SizedBox(
            height: imgSize,
            width: imgSize,
            child: Image.asset(
              bottomSheetModel.image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: isCompleted!
                ? Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bottomSheetModel.title,
                          style: const TextStyle(
                            fontSize: 22,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
