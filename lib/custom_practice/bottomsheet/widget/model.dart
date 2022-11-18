// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerse/constants/image_constants.dart';

class BottomSheetModel {
  final String image;
  final String title;
  final String year;
  BottomSheetModel({
    required this.image,
    required this.title,
    required this.year,
  });
}

List<BottomSheetModel> bottomsheetmodels = [
  BottomSheetModel(
      image: BottomSheetImage.bottomSheet2,
      title: 'Asyad El Sout',
      year: '2021'),
  BottomSheetModel(
      image: BottomSheetImage.bottomSheet7, title: 'Msh Fair', year: '2021'),
  BottomSheetModel(
      image: BottomSheetImage.bottomSheet5, title: 'Hustla', year: '2020'),
  BottomSheetModel(
      image: BottomSheetImage.bottomSheet4, title: 'Dork Gai', year: '2019'),
  BottomSheetModel(
      image: BottomSheetImage.bottomSheet,
      title: 'Wa7d W 3shreen',
      year: '2021'),
  BottomSheetModel(
      image: BottomSheetImage.bottomSheet8, title: 'Skerty', year: '2020'),
  BottomSheetModel(
      image: BottomSheetImage.bottomSheet3, title: 'Bel Salama', year: '2019'),
  BottomSheetModel(
      image: BottomSheetImage.bottomSheet6, title: 'Laqtta', year: '2021'),
  BottomSheetModel(
      image: BottomSheetImage.bottomSheet1, title: 'Ali Baba', year: '2020'),
];
