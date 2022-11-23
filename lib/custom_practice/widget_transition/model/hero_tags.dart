import 'package:ecommerse/custom_practice/widget_transition/model/location.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/review.dart';

class HeroTag {
  static String image(String urlImage) => urlImage;

  static String addressLine1(LocationModel location) =>
      location.name + location.addressLine1;

  static String addressLine2(LocationModel location) =>
      location.name + location.addressLine2;

  static String stars(LocationModel location) =>
      location.name + location.starRating.toString();

  static String avatar(ReviewModel review, int position) =>
      review.urlImage + position.toString();

  static String logitude(LocationModel location) =>
      location.name + location.longitude.toString();

  static String latitude(LocationModel location) =>
      location.name + location.latitude.toString();

  static String icon(LocationModel location) =>
      location.name + location.icon.toString();
}
