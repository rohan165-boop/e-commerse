import 'package:ecommerse/custom_practice/ui_challenge/air_aisha.dart';
import 'package:ecommerse/custom_practice/ui_challenge/contant_card.dart';
import 'package:ecommerse/custom_practice/ui_challenge/rounded_chalange.dart';
import 'package:flutter/material.dart';

class UIHomePage extends StatelessWidget {
  const UIHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const AirAsiaBar(height: 210.0),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 40.0),
              child: Column(
                children: <Widget>[
                  _buildButtonsRow(),
                  const Expanded(child: ContentCard()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: const <Widget>[
          RoundedButton(
            text: "ONE WAY",
          ),
          RoundedButton(text: "ROUND"),
          RoundedButton(text: "MULTICITY", selected: true),
        ],
      ),
    );
  }
}
