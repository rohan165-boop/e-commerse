import 'package:ecommerse/features/apps_practice/widget/render_gap.dart';
import 'package:flutter/material.dart';

class Gap extends LeafRenderObjectWidget {
  const Gap(
    this.mainAxisExtent, {
    Key? key,
  })  : assert(mainAxisExtent >= 0 && mainAxisExtent < double.infinity),
        super(key: key);

  final double mainAxisExtent;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderGap(mainAxisExtent: mainAxisExtent);
  }

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) {
    renderObject.mainAxisExtent = mainAxisExtent;
  }
}
