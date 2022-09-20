// ignore_for_file: library_private_types_in_public_api, avoid_function_literals_in_foreach_calls, prefer_spread_collections
import 'dart:async';

import 'package:ecommerse/ui_chalange/fade_route.dart';
import 'package:ecommerse/ui_chalange/price_table/animated_dot.dart';
import 'package:ecommerse/ui_chalange/price_table/flight_stop.dart';
import 'package:ecommerse/ui_chalange/price_table/flight_stop_card.dart';
import 'package:ecommerse/ui_chalange/ticket_page/ticket_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'animated_palne_icon.dart';

class PriceTab extends StatefulWidget {
  final double? height;
  final VoidCallback? onPlaneFlightStart;

  const PriceTab({Key? key, this.height, this.onPlaneFlightStart})
      : super(key: key);

  @override
  _PriceTabState createState() => _PriceTabState();
}

class _PriceTabState extends State<PriceTab> with TickerProviderStateMixin {
  final double _initialPlanePaddingBottom = 16.0;
  final double _minPlanePaddingTop = 16.0;
  final List<FlightStop> _flightStops = [
    FlightStop("JFK", "ORY", "JUN 05", "6h 25m", "\$851", "9:26 am - 3:43 pm"),
    FlightStop("MRG", "FTB", "JUN 20", "6h 25m", "\$532", "9:26 am - 3:43 pm"),
    FlightStop("ERT", "TVS", "JUN 20", "6h 25m", "\$718", "9:26 am - 3:43 pm"),
    FlightStop("KKR", "RTY", "JUN 20", "6h 25m", "\$663", "9:26 am - 3:43 pm"),
  ];
  final List<GlobalKey<FlightStopCardState>> _stopKeys = [];

  late AnimationController _planeSizeAnimationController;
  late AnimationController _planeTravelController;
  late AnimationController _dotsAnimationController;
  late AnimationController _fabAnimationController;
  late Animation _planeSizeAnimation;
  late Animation _planeTravelAnimation;
  late Animation _fabAnimation;

  final List<Animation<dynamic>> _dotPositions = [];

  double get _planeTopPadding =>
      _minPlanePaddingTop +
      (1 - _planeTravelAnimation.value) * _maxPlaneTopPadding;

  double get _maxPlaneTopPadding =>
      widget.height! -
      _minPlanePaddingTop -
      _initialPlanePaddingBottom -
      _planeSize;

  double get _planeSize => _planeSizeAnimation.value;

  @override
  void initState() {
    super.initState();
    _initSizeAnimations();
    _initPlaneTravelAnimations();
    _initDotAnimationController();
    _initDotAnimations();
    _initFabAnimationController();
    _flightStops
        .forEach((stop) => _stopKeys.add(GlobalKey<FlightStopCardState>()));
    _planeSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _planeSizeAnimationController.dispose();
    _planeTravelController.dispose();
    _dotsAnimationController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[_buildPlane()]
          ..addAll(_flightStops.map(_buildStopCard))
          ..addAll(_flightStops.map(_mapFlightStopToDot))
          ..add(_buildFab()),
      ),
    );
  }

  Widget _buildStopCard(FlightStop stop) {
    int index = _flightStops.indexOf(stop);
    double topMargin = _dotPositions[index].value -
        0.5 * (FlightStopCard.height - AnimatedDot.size);
    bool isLeft = index.isOdd;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: topMargin),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isLeft ? Container() : Expanded(child: Container()),
            Expanded(
              child: FlightStopCard(
                key: _stopKeys[index],
                flightStop: stop,
                isLeft: isLeft,
              ),
            ),
            !isLeft ? Container() : Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Widget _mapFlightStopToDot(stop) {
    int index = _flightStops.indexOf(stop);
    bool isStartOrEnd = index == 0 || index == _flightStops.length - 1;
    Color color = isStartOrEnd ? Colors.red : Colors.green;
    return AnimatedDot(
      animation: _dotPositions[index],
      color: color,
    );
  }

  Widget _buildPlane() {
    return AnimatedBuilder(
      animation: _planeTravelAnimation,
      child: Column(
        children: <Widget>[
          AnimatedPlaneIcon(animation: _planeSizeAnimation),
          Container(
            width: 2.0,
            height: _flightStops.length * FlightStopCard.height * 0.8,
            color: const Color.fromARGB(255, 200, 200, 200),
          ),
        ],
      ),
      builder: (context,  child) => Positioned(
            top: _planeTopPadding,
            child: child!,
          ),
    );
  }

  Widget _buildFab() {
    return Positioned(
      bottom: 16.0,
      child: ScaleTransition(
        scale: _fabAnimation,
        child: FloatingActionButton(
          onPressed: () => Navigator
              .of(context)
              .push(FadeRoute(builder: (context) => const TicketsPage())),
          child: const Icon(Icons.check, size: 36.0),
        ),
      ),
    );
  }

  _initSizeAnimations() {
    _planeSizeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 340),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(milliseconds: 500), () {
            widget.onPlaneFlightStart!();
            _planeTravelController.forward();
          });
          Future.delayed(const Duration(milliseconds: 700), () {
            _dotsAnimationController.forward();
          });
        }
      });
    _planeSizeAnimation =
        Tween<double>(begin: 60.0, end: 36.0).animate(CurvedAnimation(
      parent: _planeSizeAnimationController,
      curve: Curves.easeOut,
    ));
  }

  _initPlaneTravelAnimations() {
    _planeTravelController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _planeTravelAnimation = CurvedAnimation(
      parent: _planeTravelController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _initDotAnimations() {
    //what part of whole animation takes one dot travel
    const double slideDurationInterval = 0.4;
    //what are delays between dot animations
    const double slideDelayInterval = 0.2;
    //at the bottom of the screen
    double? startingMarginTop = widget.height;
    //minimal margin from the top (where first dot will be placed)
    double minMarginTop =
        _minPlanePaddingTop + _planeSize + 0.5 * (0.8 * FlightStopCard.height);

    for (int i = 0; i < _flightStops.length; i++) {
      final start = slideDelayInterval * i;
      final end = start + slideDurationInterval;

      double finalMarginTop = minMarginTop + i * (0.8 * FlightStopCard.height);
      Animation<double> animation = Tween(
        begin: startingMarginTop,
        end: finalMarginTop,
      ).animate(
        CurvedAnimation(
          parent: _dotsAnimationController,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
      _dotPositions.add(animation);
    }
  }

  void _initDotAnimationController() {
    _dotsAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animateFlightStopCards().then((_) => _animateFab());
        }
      });
  }

  Future _animateFlightStopCards() async {
    return Future.forEach(_stopKeys, (GlobalKey<FlightStopCardState> stopKey) {
      return Future.delayed(const Duration(milliseconds: 250), () {
        stopKey.currentState!.runAnimation();
      });
    });
  }

  void _initFabAnimationController() {
    _fabAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _fabAnimation = CurvedAnimation(
        parent: _fabAnimationController, curve: Curves.easeOut);
  }

  _animateFab() {
    _fabAnimationController.forward();
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AnimationController>('_planeSizeAnimationController', _planeSizeAnimationController));
  }
}