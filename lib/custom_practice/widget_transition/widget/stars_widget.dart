import 'package:ecommerse/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  const StarsWidget({
    Key? key,
    required this.stars,
  }) : super(key: key);

  final int stars;

  @override
  Widget build(BuildContext context) {
    final allStars = List.generate(stars, (index) => index);

    return Row(
      children: allStars
          .map((star) => Container(
                margin: const EdgeInsets.only(right: 4),
                child: const Icon(Icons.star_rate,
                    size: 18, color: AppColors.bluegrey),
              ))
          .toList(),
    );
  }
}
