import 'package:ecommerse/constants/app_colors.dart';
import 'package:ecommerse/custom_practice/widget_transition/widget/custom_locations_widget2.dart';
import 'package:flutter/material.dart';

class TransitionHomeScreen extends StatelessWidget {
  const TransitionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bluegrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('INTERESTS'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.location_pin),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {},
        ),
      ),
      body: const CustomLocationsWidget2(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: AppColors.white.withOpacity(0.54),
        selectedItemColor: AppColors.white,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
