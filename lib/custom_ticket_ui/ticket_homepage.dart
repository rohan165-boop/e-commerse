import 'package:ecommerse/custom_ticket_ui/exhibition_bottom_sheet.dart';
import 'package:ecommerse/custom_ticket_ui/sliding_cards.dart';
import 'package:ecommerse/custom_ticket_ui/tabs.dart';
import 'package:flutter/material.dart';

class CustomTicketHome extends StatelessWidget {
  const CustomTicketHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:const <Widget>[
                SizedBox(height: 8),
                Header(),
                SizedBox(height: 40),
                Tabs(),
                SizedBox(height: 8),
                SlidingCardsView(),
              ],
            ),
          ),
          const ExhibitionBottomSheet(), 
          //use this or ScrollableExhibitionSheet
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'Shenzhen',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}