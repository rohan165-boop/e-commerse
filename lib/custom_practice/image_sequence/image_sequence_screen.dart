import 'package:flutter/cupertino.dart';
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
      isOnline ? onlineImageSequenceAnimator : offlineImageSequenceAnimator;
  ImageSequenceAnimatorState? offlineImageSequenceAnimator;
  ImageSequenceAnimatorState? onlineImageSequenceAnimator;

  bool isOnline = false;
  bool wasPlaying = false;

  Color color1 = Colors.greenAccent;
  Color color2 = Colors.indigo;

  String onlineOfflineText = "Use Online";
  String loopText = "Start Loop";
  String boomerangText = "Start Boomerang";

  bool _useFullPaths = false;
  List<String>? _fullPathsOffline;
  List<String>? _fullPathsOnline;

  void onOfflineReadyToPlay(ImageSequenceAnimatorState imageSequenceAnimator) {
    offlineImageSequenceAnimator = imageSequenceAnimator;
  }

  void onOfflinePlaying(ImageSequenceAnimatorState imageSequenceAnimator) {
    setState(() {});
  }

  void onOnlineReadyToPlay(ImageSequenceAnimatorState imageSequenceAnimator) {
    onlineImageSequenceAnimator = imageSequenceAnimator;
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

  @override
  Widget build(BuildContext context) {
    if (_fullPathsOffline == null && _fullPathsOnline == null) {
      _fullPathsOffline = [];
      _fullPathsOnline = [];
      for (int i = 0; i < 60; i++) {
        String _value = i.toString();
        while (_value.length < 5) _value = "0$_value";
        _fullPathsOffline!.add("assets/ImageSequence/Frame_$_value.png");
        _fullPathsOnline!.add(
            "https://www.cosmossoftware.coffee/AppData/ImageSequenceAnimator/ImageSequence/Frame_$_value.png");
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
              child: isOnline
                  ? ImageSequenceAnimator(
                      "https://www.cosmossoftware.coffee/AppData/ImageSequenceAnimator/ImageSequence",
                      "Frame_",
                      0,
                      5,
                      "png",
                      60,
                      key: const Key("online"),
                      fullPaths: _useFullPaths ? _fullPathsOffline : null,
                      isAutoPlay: true,
                      isOnline: true,
                      // color: color1,
                      onReadyToPlay: onOnlineReadyToPlay,
                      onPlaying: onOnlinePlaying,
                    )
                  : ImageSequenceAnimator(
                      "assets/guitarsequence",
                      "",
                      1,
                      4,
                      "png",
                      120,
                      key: const Key("offline"),
                      fullPaths: _useFullPaths ? _fullPathsOffline : null,
                      color: color1,
                      onReadyToPlay: onOfflineReadyToPlay,
                      onPlaying: onOfflinePlaying,
                    ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: CupertinoSlider(
                    value: imageSequenceAnimator == null
                        ? 0.0
                        : imageSequenceAnimator!.currentProgress,
                    min: 0.0,
                    max: imageSequenceAnimator == null
                        ? 100.0
                        : imageSequenceAnimator!.totalProgress,
                    onChangeStart: (double value) {
                      wasPlaying = imageSequenceAnimator!.isPlaying;
                      imageSequenceAnimator!.pause();
                    },
                    onChanged: (double value) {
                      imageSequenceAnimator!.skip(value);
                    },
                    onChangeEnd: (double value) {
                      if (wasPlaying) imageSequenceAnimator!.play();
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      imageSequenceAnimator == null
                          ? "0.0"
                          : ("${imageSequenceAnimator!.currentTime.floor()}/${imageSequenceAnimator!.totalTime.floor()}"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
