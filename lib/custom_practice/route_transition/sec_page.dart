import 'package:ecommerse/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SecendPage extends StatelessWidget {
  const SecendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPink,
      appBar: AppBar(
        title: const Text("Sec page"),
      ),
      // body:Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     Image.asset(ImageConstants.efe, height: 200,),
      //     Image.asset(ImageConstants.efe, height: 200,),
      //     Image.asset(ImageConstants.efe, height: 200,)
      //   ],
      // )
    );
  }
}
