import 'package:ecommerse/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerDetailPage extends StatelessWidget {
  const ContainerDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPink,
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 50,
            color: AppColors.orange,
          ),
        ),
      ),
    );
  }
}
