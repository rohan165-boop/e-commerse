import 'package:ecommerse/features/apps_practice/model/app_model.dart';
import 'package:ecommerse/features/apps_practice/widget/custom_grid_widget.dart';
import 'package:ecommerse/widgets/custom_app_bar_widgets.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Apps",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 2.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: appModel.length,
          itemBuilder: (context, index) => GrideWidget(
            title: appModel[index].title,
            image: appModel[index].image,
            press: appModel[index].press,
          ),
        ),
      ),
    );
  }
}
