import 'package:ecommerse/features/shop_page/widget/gap.dart';
import 'package:ecommerse/widgets/custom_app_bar_widgets.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Shopping Card",
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(height: 20, color: Colors.red),
            const Gap(80),
            Container(height: 20, color: Colors.red),
            Row(
              children: <Widget>[
                Container(width: 20, height: 20, color: Colors.green),
                 const Gap(50),
                Container(width: 20, height: 20, color: Colors.green),
              ],
            ),
            Container(height: 200, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}