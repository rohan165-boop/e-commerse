import 'package:ecommerse/custom_practice/weather/assets_path.dart';
import 'package:ecommerse/custom_practice/weather/model/fade_away.dart';
import 'package:ecommerse/custom_practice/weather/model/weather_data.dart';
import 'package:flutter/material.dart';

class TodayDetailsWidget extends AnimatedWidget {
  final WeatherData weatherData;
  final Animatable<FadeAway> temperatureTween;
  final Animatable<FadeAway> detailsTween;

  const TodayDetailsWidget(
      {Key? key,
      required this.weatherData,
      required Animation<double> progress,
      required this.temperatureTween,
      required this.detailsTween})
      : super(key: key, listenable: progress);

  Animation<double> get _animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    // Both tweens are animated at the same moment so we will use our
    // animation progress to evaluate each Tween interpolated value
    final temperatureCurrentValue = temperatureTween.evaluate(_animation);
    final detailsCurrentValue = detailsTween.evaluate(_animation);

    final now = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
            offset: temperatureCurrentValue.offset,
            child: Opacity(
              opacity: temperatureCurrentValue.opacity,
              child: _temperature(context, now),
            )),
        const SizedBox(
          width: 16,
        ),
        Transform.translate(
          offset: detailsCurrentValue.offset,
          child: Opacity(
              opacity: detailsCurrentValue.opacity,
              child: _windAndWeatherText(context, now)),
        ),
      ],
    );
  }

  Widget _temperature(BuildContext context, DateTime now) {
    return Text('${weatherData.temperature(now)}°',
        style: Theme.of(context).textTheme.headline2);
  }

  Widget _windAndWeatherText(BuildContext context, DateTime now) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(AssetPath.weatherAsset(weatherData.weatherType(now)!),
            width: 24, height: 24),
        const SizedBox(
          width: 8,
        ),
        Text(weatherData.weatherTypeText(now) ?? '',
            style: Theme.of(context).textTheme.headline6),
      ]),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.air_outlined),
          const SizedBox(
            width: 8,
          ),
          Text(
            '${weatherData.wind(now)} km/h',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    ]);
  }
}