// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerse/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.appGrey)),
          child: Icon(
            icon,
            color: AppColors.appBlack,
          ),
        ),
        Text(
          title,
        )
      ],
    );
  }
}
