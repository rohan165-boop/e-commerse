import 'package:ecommerse/constants/image_constants.dart';

class ReviewModel {
  final String username;
  final String urlImage;
  final String date;
  final String description;

  ReviewModel({
    required this.username,
    required this.urlImage,
    required this.date,
    required this.description,
  });
}

List<ReviewModel> allReviews = [
  ReviewModel(
    date: 'FEB 14th',
    username: 'Michael Scoffield',
    urlImage: ImageTransitionConstant.image5,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
  ),
  ReviewModel(
    date: 'JAN 24th',
    username: 'Daniel Kraig',
    urlImage: ImageTransitionConstant.image6,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
  ),
  ReviewModel(
    date: 'MAR 18th',
    username: 'Amanda Linn',
    urlImage: ImageTransitionConstant.image7,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
  ),
  ReviewModel(
    date: 'AUG 15th',
    username: 'Kim Wexler',
    urlImage: ImageTransitionConstant.image8,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
  ),
];
