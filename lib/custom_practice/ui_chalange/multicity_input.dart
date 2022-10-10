import 'package:ecommerse/custom_practice/ui_chalange/tap_able_text.dart';
import 'package:flutter/material.dart';

class MulticityInput extends StatefulWidget {
  const MulticityInput({super.key});

  @override
  MulticityInputState createState() {
    return MulticityInputState();
  }
}

class MulticityInputState extends State<MulticityInput>
    with TickerProviderStateMixin {
  late AnimationController textInputAnimationController;

  @override
  void initState() {
    super.initState();
    textInputAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    textInputAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TypeableTextFormField(
                finalText: "Brt",
                animation: _buildInputAnimation(begin: 0.0,end: 0.2),
                decoration: const InputDecoration(
                  icon: Icon(Icons.flight_takeoff, color: Colors.red),
                  labelText: "From",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TypeableTextFormField(
                animation: _buildInputAnimation(begin: 0.15,end: 0.35),
                finalText: "Ktm",
                decoration: const InputDecoration(
                  icon: Icon(Icons.flight_land, color: Colors.red),
                  labelText: "To",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TypeableTextFormField(
                      animation: _buildInputAnimation(begin: 0.3,end: 0.5),
                      finalText: "Nepal",
                      decoration: const InputDecoration(
                        icon: Icon(Icons.flight_land, color: Colors.red),
                        labelText: "To",
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 64.0,
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () => textInputAnimationController.forward(),
                      icon: const Icon(Icons.add_circle_outline, color: Colors.grey)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TypeableTextFormField(
                animation: _buildInputAnimation(begin: 0.45,end: 0.65),
                finalText: "4",
                decoration: const InputDecoration(
                  icon: Icon(Icons.person, color: Colors.red),
                  labelText: "Passengers",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.date_range, color: Colors.red),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TypeableTextFormField(
                      animation: _buildInputAnimation(begin: 0.6, end: 0.8),
                      finalText: "29 June 2017",
                      decoration: const InputDecoration(labelText: "Departure"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TypeableTextFormField(
                      animation: _buildInputAnimation(begin: 0.75, end: 0.95),
                      finalText: "29 July 2017",
                      decoration: const InputDecoration(labelText: "Arrival"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CurvedAnimation _buildInputAnimation({required double begin, required double end}) {
    return CurvedAnimation(
        parent: textInputAnimationController,
        curve: Interval(begin, end, curve: Curves.linear)
    );
  }

}