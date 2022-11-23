import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/hero_tags.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/location.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/review.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/custom_hero_widget.dart';
import 'package:flutter/material.dart';

class ReviewsWidget extends StatelessWidget {
  final LocationModel location;
  final Animation<double> animation;

  const ReviewsWidget({
    required this.location,
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
      itemCount: location.reviews.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final review = location.reviews[index];

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) => FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: const Interval(0.2, 1, curve: Curves.easeInExpo),
            ),
            child: child,
          ),
          child: buildReview(review),
        );
      });

  Widget buildReview(ReviewModel review) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomHeroWidget(
                  tag: HeroTag.avatar(review, locations.indexOf(location)),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.appBlack.withOpacity(0.12),
                    backgroundImage: AssetImage(review.urlImage),
                  ),
                ),
                Text(
                  review.username,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(),
                Text(
                  review.date,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const Icon(Icons.thumb_up_alt_outlined, size: 14)
              ],
            ),
            const SizedBox(height: 8),
            Text(
              review.description,
              style: TextStyle(color: AppColors.appBlack.withOpacity(0.54)),
            ),
          ],
        ),
      );
}
