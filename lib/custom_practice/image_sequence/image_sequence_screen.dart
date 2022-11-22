import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

class ImageSequenceHomeScreen extends StatefulWidget {
  const ImageSequenceHomeScreen({super.key});

  @override
  State<ImageSequenceHomeScreen> createState() =>
      _ImageSequenceHomeScreenState();
}

class _ImageSequenceHomeScreenState extends State<ImageSequenceHomeScreen> {
  ImageSequenceAnimatorState? get imageSequenceAnimator =>
      offlineImageSequenceAnimator;
  ImageSequenceAnimatorState? offlineImageSequenceAnimator;

  bool wasPlaying = false;

  Color color1 = Colors.greenAccent;
  Color color2 = Colors.indigo;

  bool useFullPaths = false;
  List<String>? _fullPathsOffline;

  void onOfflineReadyToPlay(ImageSequenceAnimatorState imageSequenceAnimator) {
    offlineImageSequenceAnimator = imageSequenceAnimator;
  }

  void onOfflinePlaying(ImageSequenceAnimatorState imageSequenceAnimator) {
    setState(() {});
  }

  void onOnlinePlaying(ImageSequenceAnimatorState imageSequenceAnimator) {
    setState(() {});
  }

  Widget row(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(3.125),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.5,
            ),
          ),
        ),
      ),
    );
  }

  ontoggle(double value) {
    if (wasPlaying == imageSequenceAnimator!.isPlaying) {
      imageSequenceAnimator!.pause();
    } else if (wasPlaying) {
      imageSequenceAnimator!.play();
    } else {
      imageSequenceAnimator!.skip(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_fullPathsOffline == null) {
      _fullPathsOffline = [];
      for (int i = 0; i < 60; i++) {
        String value = i.toString();
        while (value.length < 5) {
          value = "0$value";
        }
        _fullPathsOffline!.add("assets/ImageSequence/Frame_$value.png");
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Sequence"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: ImageSequenceAnimator(
                "assets/guitarsequence",
                "",
                1,
                4,
                "png",
                120,
                key: const Key("offline"),
                fullPaths: useFullPaths ? _fullPathsOffline : null,
                // color: color1,
                // onReadyToPlay: onOfflineReadyToPlay,
                // onPlaying: onOfflinePlaying,
              ),
            ),
          ),
          // Expanded(
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 4,
          //         child: CupertinoSlider(
          //           value: imageSequenceAnimator == null
          //               ? 0.0
          //               : imageSequenceAnimator!.currentProgress,
          //           min: 0.0,
          //           max: imageSequenceAnimator == null
          //               ? 100.0
          //               : imageSequenceAnimator!.totalProgress,
          //           onChangeStart: (double value) {
          //             wasPlaying = imageSequenceAnimator!.isPlaying;
          //             imageSequenceAnimator!.pause();
          //           },
          //           onChanged: (double value) {
          //             imageSequenceAnimator!.skip(value);
          //           },
          //           onChangeEnd: (double value) {
          //             if (wasPlaying) imageSequenceAnimator!.play();
          //           },
          //         ),
          //       ),
          //       Expanded(
          //         child: Center(
          //           child: Text(
          //             imageSequenceAnimator == null
          //                 ? "0.0"
          //                 : ("${imageSequenceAnimator!.currentTime.floor()}/${imageSequenceAnimator!.totalTime.floor()}"),
          //             textAlign: TextAlign.center,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
