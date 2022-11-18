// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerse/constants/image_constants.dart';

class PaintingModel {
  final String image;
  final String title;
  PaintingModel({
    required this.image,
    required this.title,
  });
}

List<PaintingModel> paintings = [
  PaintingModel(
    image: PaintingImage.painting1,
    title: "The Starry Night",
  ),
  PaintingModel(
    image: PaintingImage.painting2,
    title: "The Potato Eaters",
  ),
  PaintingModel(
    image: PaintingImage.painting3,
    title: "Irises",
  ),
  PaintingModel(
    image: PaintingImage.painting4,
    title: "Starry Night Over the Rhone",
  ),
  PaintingModel(
    image: PaintingImage.painting5,
    title: "Landscape with Snow",
  ),
  PaintingModel(
    image: PaintingImage.painting6,
    title: "The Sower",
  ),
  PaintingModel(
    image: PaintingImage.painting7,
    title: "The Night Cafa",
  ),
  PaintingModel(
    image: BottomSheetImage.bottomSheet9,
    title: "The Devil",
  ),
];
