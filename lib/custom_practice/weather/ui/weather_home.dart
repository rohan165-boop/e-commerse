// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerse/custom_practice/weather/model/fade_away.dart';
import 'package:ecommerse/custom_practice/weather/model/weather_data.dart';
import 'package:ecommerse/custom_practice/weather/model/weather_type.dart';
import 'package:ecommerse/custom_practice/weather/sample_data_generator.dart';
import 'package:ecommerse/custom_practice/weather/ui/bottom_card.dart';
import 'package:ecommerse/custom_practice/weather/ui/cloudy_widget.dart';
import 'package:ecommerse/custom_practice/weather/ui/moon_widget.dart';
import 'package:ecommerse/custom_practice/weather/ui/sun_widget.dart';
import 'package:ecommerse/custom_practice/weather/ui/today_deatils_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherHomeScreen extends StatefulWidget {
  /// Knowing the [width] of the widget will allow us to make the UI responsive
  final double width;
  const WeatherHomeScreen({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> with SingleTickerProviderStateMixin {

  bool _isDayTheme = true;
  List<WeatherData> weatherData =
      SampleDataGenerator.getData(todayWeatherType: WeatherType.rainy);

  // These DateFormat come from the [intl] package
  DateFormat hourFormat = DateFormat.Hm();
  DateFormat dayFormat = DateFormat.EEEE();

  late ThemeData _dayTheme;
  late ThemeData _nightTheme;

  // Day/Night transition
  late AnimationController _animationController;
  late Animation<Offset> _sunMoveAnim;
  late Animation<Offset> _moonMoveAnim;
  late Animation<ThemeData> _themeAnim;
  late TweenSequence<FadeAway> _temperatureAnim;
  late TweenSequence<FadeAway> _weatherDetailsAnim;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _dayTheme = ThemeData.from(
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.cyan,
                brightness: Brightness.light,
                backgroundColor: const Color(0xFFB8FBFF)))
        .copyWith(
            // We use the textTheme of the base Material theme by using
            // Theme.of(context).textTheme. Properties like
            // Theme.of(context).textTheme.headline1 will be set according to
            // Material Design.
            // See the docs: https://api.flutter.dev/flutter/material/TextTheme-class.html
            textTheme: Theme.of(context).textTheme.apply(
                  // When on light theme, we set the text color to black
                  bodyColor: Colors.black,
                  displayColor: Colors.black,
                ));
    _nightTheme = ThemeData.from(
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.cyan,
                brightness: Brightness.dark,
                backgroundColor: const Color(0xFF070429)))
        .copyWith(
            textTheme: Theme.of(context).textTheme.apply(
                  // When on dark theme, we set the text color to white
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                ));
    _isDayTheme = Theme.of(context).brightness == Brightness.light;
    _initThemeAnims(dayToNight: _isDayTheme);
  }

  void _initThemeAnims({required bool dayToNight}) {
    final disappearAnim =
        Tween<Offset>(begin: const Offset(0, 0), end: Offset(-widget.width, 0))
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.3,
        curve: Curves.ease,
      ),
    ));

    final appearAnim =
        Tween<Offset>(begin: Offset(widget.width, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.ease,
      ),
    ));

    // Assign the appearing or disappearing anim to the sun or moon depending
    // on the transition we will perform (day to night or night to day)
    _sunMoveAnim = dayToNight ? disappearAnim : appearAnim;
    _moonMoveAnim = dayToNight ? appearAnim : disappearAnim;

    // We use the ThemeDataTween to make the interpolation between dayTheme
    // and nightTheme
    _themeAnim = (dayToNight
            ? ThemeDataTween(begin: _dayTheme, end: _nightTheme)
            : ThemeDataTween(begin: _nightTheme, end: _dayTheme))
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.3,
        0.7,
        curve: Curves.easeIn,
      ),
    ));

    _temperatureAnim = TweenSequence<FadeAway>([
      TweenSequenceItem(
          tween: Tween<FadeAway>(
                  begin: const FadeAway(Offset(0, 0), 1.0),
                  end: const FadeAway(Offset(-100, 0), 0.0))
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 40),
      TweenSequenceItem(
          tween: ConstantTween<FadeAway>(const FadeAway(Offset(-100, 0), 0.0)),
          weight: 20),
      TweenSequenceItem(
          tween: Tween<FadeAway>(
                  begin: const FadeAway(Offset(-100, 0), 0.0),
                  end: const FadeAway(Offset(0, 0), 1.0))
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 40),
    ]);

    _weatherDetailsAnim = TweenSequence<FadeAway>([
      TweenSequenceItem(
          tween: Tween<FadeAway>(
                  begin: const FadeAway(Offset(0, 0), 1.0),
                  end: const FadeAway(Offset(100, 0), 0.0))
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 40),
      TweenSequenceItem(
          tween: ConstantTween<FadeAway>(const FadeAway(Offset(100, 0), 0.0)),
          weight: 20),
      TweenSequenceItem(
          tween: Tween<FadeAway>(
                  begin: const FadeAway(Offset(100, 0), 0.0),
                  end: const FadeAway(Offset(0, 0), 1.0))
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 40),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _themeAnim,
        child: _content(),
        builder: (context, child) {
          return Theme(
            data: _themeAnim.value,
            child: child!,
          );
        });
  }

   Widget _content() {
    final todayWeather = weatherData.first;
    final now = DateTime.now();

    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(dayFormat.format(now)),
                      Text(hourFormat.format(now))
                    ]),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: Stack(children: [
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.topCenter,
                        child: _sunOrMoon(),
                      )),
                      if (todayWeather.avgWeatherType != WeatherType.sunny)
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.topCenter,
                          child: CloudyWidget(
                              weatherType: todayWeather.avgWeatherType),
                        )),
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: _animationButton(),
                        ),
                      )),
                    ]),
                  ),
                ]),
              ),
              TodayDetailsWidget(
                weatherData: todayWeather,
                progress: _animationController,
                temperatureTween: _temperatureAnim,
                detailsTween: _weatherDetailsAnim,
              ),
              BottomCard(
                weatherData: weatherData,
              ),
            ]),
      ),
    );
  }

  Widget _sunOrMoon() {
    if (_isDayTheme) {
      return SunWidget(listenable: _sunMoveAnim);
    } else {
      return MoonWidget(listenable: _moonMoveAnim);
    }
  }

  Widget _animationButton() {
    return OutlinedButton.icon(
      icon: const Icon(Icons.play_arrow),
      onPressed: () {
        _switchTheme();
      },
      label: const Text('SWITCH THEMES'),
    );
  }

  void _switchTheme() {
    // Remove the previous listener before adding the new one
    if (_isDayTheme) {
      _animationController.removeListener(_nightToDayAnimListener);
      _animationController.addListener(_dayToNightAnimListener);
    } else {
      _animationController.removeListener(_dayToNightAnimListener);
      _animationController.addListener(_nightToDayAnimListener);
    }
    // Init again the Animation objects with the new _isDayTheme setting
    _initThemeAnims(dayToNight: _isDayTheme);
    setState(() {
      // refresh the state with our new Animation objects
      // and restart the animationController
      _animationController.reset();
      _animationController.forward();
    });
  }

  void _dayToNightAnimListener() {
    _animListener(true);
  }

  void _nightToDayAnimListener() {
    _animListener(false);
  }

  void _animListener(bool dayToNight) {
    // Update _isDayTheme based on the current animation value
    if ((_isDayTheme && dayToNight || !_isDayTheme && !dayToNight) &&
        _animationController.value >= 0.5) {
      setState(() {
        _isDayTheme = !dayToNight;
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}