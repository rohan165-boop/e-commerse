// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyCenter extends SingleChildRenderObjectWidget {
  const MyCenter({Key? key, Widget? child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _randerMyCenter();
  }
}

class _randerMyCenter extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    if (child != null) {
      size = constraints.biggest;
      child!.layout(constraints.loosen(), parentUsesSize: true);
      double dx = (constraints.maxWidth - child!.size.width) / 2;
      double dy = (constraints.maxHeight - child!.size.height) / 2;

      BoxParentData childParentData = child!.parentData as BoxParentData;
      childParentData.offset = Offset(dx, dy);
    } else {
      size = const Size(0, 0);
    }
    super.performLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if(child != null) {
      var parentData = child!.parentData as BoxParentData;
      context.paintChild(child!, offset + parentData.offset);
    }
    super.paint(context, offset);
  }
}
