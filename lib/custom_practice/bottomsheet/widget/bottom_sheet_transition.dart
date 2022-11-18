import 'dart:ui';
import 'dart:math' as math;

import 'package:ecommerse/custom_practice/bottomsheet/widget/buttom_sheet_container.dart';
import 'package:ecommerse/custom_practice/bottomsheet/widget/model.dart';
import 'package:flutter/material.dart';

class BottomSheetTransition extends StatefulWidget {
  const BottomSheetTransition({super.key});

  @override
  State<BottomSheetTransition> createState() => _BottomSheetTransitionState();
}

class _BottomSheetTransitionState extends State<BottomSheetTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double get maxHeight => MediaQuery.of(context).size.height - 40;
  double bottomImgStartSize = 45;
  double bottomImgEndSize = 120;
  double bottomVerticalSpace = 25;
  double bottomHorizontalSpace = 15;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );
    super.initState();
  }

  double? lerp(double min, double max) {
    return lerpDouble(min, max, _controller.value);
  }

  void toggle() {
    final bool isCompleted = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isCompleted ? -1 : 1);
  }

  void verticalDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta! / maxHeight;
  }

  void verticalDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;

    if (flingVelocity < 0) {
      _controller.fling(velocity: math.max(1, -flingVelocity));
    } else if (flingVelocity > 0) {
      _controller.fling(velocity: math.min(-1, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -1 : 1);
    }
  }

  double? songTopMargin(int index) {
    return lerp(20, 10 + index * (bottomVerticalSpace + bottomImgEndSize));
  }

  double? songLeftMargin(int index) {
    return lerp(index * (bottomHorizontalSpace + bottomImgStartSize), 0);
  }

  Widget buildSongContainer(BottomSheetModel bottomSheetModel) {
    int index = bottomsheetmodels.indexOf(bottomSheetModel);
    return BottomSheetContainer(
      bottomSheetModel: bottomSheetModel,
      imgSize: lerp(bottomImgStartSize, bottomImgEndSize),
      topMargin: songTopMargin(index),
      leftMargin: songLeftMargin(index),
      isCompleted: _controller.status == AnimationStatus.completed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: lerp(120, maxHeight),
          child: GestureDetector(
            onTap: toggle,
            onVerticalDragUpdate: verticalDragUpdate,
            onVerticalDragEnd: verticalDragEnd,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff920201),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      right: 0,
                      top: lerp(20, 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Songs',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: lerp(15, 25),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            _controller.status == AnimationStatus.completed
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                            color: Colors.white,
                            size: lerp(15, 25),
                          )
                        ],
                      )),
                  Positioned(
                    top: lerp(35, 80),
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SingleChildScrollView(
                      scrollDirection:
                          _controller.status == AnimationStatus.completed
                              ? Axis.vertical
                              : Axis.horizontal,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      child: SizedBox(
                        height: (bottomImgEndSize + bottomVerticalSpace) *
                            bottomsheetmodels.length,
                        width: (bottomImgStartSize + bottomHorizontalSpace) *
                            bottomsheetmodels.length,
                        child: Stack(
                          children: [
                            for (BottomSheetModel bottomSheetModel
                                in bottomsheetmodels)
                              buildSongContainer(bottomSheetModel),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
