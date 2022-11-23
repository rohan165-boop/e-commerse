import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/constants/image_constants.dart';
import 'package:ecommerse/custom_practice/widget_transition/model/review.dart';
import 'package:flutter/material.dart';

class LocationModel {
  final String name;
  final IconData icon;
  final String urlImage;
  final String latitude;
  final String longitude;
  final String addressLine1;
  final String addressLine2;
  final int starRating;
  final List<ReviewModel> reviews;

  LocationModel({
    required this.reviews,
    required this.icon,
    required this.name,
    required this.urlImage,
    required this.latitude,
    required this.longitude,
    required this.addressLine1,
    required this.addressLine2,
    required this.starRating,
  });
}

List<LocationModel> locations = [
  LocationModel(
    name: 'ATCOASTAL',
    icon: Icons.location_on,
    urlImage: ImageTransitionConstant.image3,
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 791187',
    starRating: 4,
    latitude: 'NORTH LAT 24',
    longitude: 'EAST LNG 17',
    reviews: allReviews,
  ),
  LocationModel(
    name: 'SYRACUSE',
    icon: Icons.location_on,
    urlImage: ImageTransitionConstant.image1,
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 11641',
    starRating: 4,
    latitude: 'SOUTH LAT 14',
    longitude: 'EAST LNG 27',
    reviews: allReviews,
  ),
  LocationModel(
    name: 'OCEANIC',
    icon: Icons.location_on,
    urlImage: ImageTransitionConstant.image4,
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 791187',
    starRating: 4,
    latitude: 'NORTH LAT 24',
    longitude: 'WEST LNG 08',
    reviews: allReviews,
  ),
  LocationModel(
    name: 'MOUNTAINOUS',
    icon: Icons.location_on,
    urlImage: ImageTransitionConstant.image2,
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 791187',
    starRating: 4,
    latitude: 'SOUTH LAT 39',
    longitude: 'WEST LNG 41',
    reviews: allReviews,
  ),
];
