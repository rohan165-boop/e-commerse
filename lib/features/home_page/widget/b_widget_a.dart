import 'package:ecommerse/features/home_page/widget/animated_container.dart';
import 'package:ecommerse/features/home_page/widget/custom_clipper_widget.dart';
import 'package:ecommerse/features/home_page/widget/p_r.dart';
import 'package:ecommerse/widgets/drag_ui.dart';
import 'package:flutter/material.dart';

class BWidgetA extends StatelessWidget {
  const BWidgetA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              _showDialog(context);
            },
            child: const Text("allert")),
        Center(
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height / 4,
              width: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 200,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedConatinerScreen()));
            },
            child: const Text("Animation")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExampleDragAndDrop()));
            },
            child: const Text("Drag Ui")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const PR()));
            },
            child: const Text("PR")),
      ],
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        titlePadding: const EdgeInsets.all(0.0),
        title: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text("Alert Dialog Box"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Content writing services"),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              child: const Text("Cancle"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              child: const Text("Submit"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ),
            Positioned(
              left: 115,
              bottom: 174,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green),
              ),
            ),
          ],
        ),
        // content:  Container(
        //   padding: const EdgeInsets.all(20),
        //   height: 100,
        //   width: double.infinity,
        //   child: const Text("You are awesome!")),
        // actions: <Widget>[
        //   ElevatedButton(
        //     child: const Text("OK"),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ],
      );
    },
  );
}
