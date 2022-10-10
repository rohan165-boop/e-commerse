import 'dart:math';

import 'package:ecommerse/custom_practice/weather/model/weather_data_detail.dart';
import 'package:ecommerse/custom_practice/weather/model/weather_type.dart';
import 'package:flutter/foundation.dart';

class WeatherData {
  final DateTime date;
  final DateTime sunset;
  final DateTime sunrise;
  final List<WeatherDataDetail> details;

  WeatherData({
    required this.date,
    required this.sunrise,
    required this.sunset,
    required this.details,
  });

  double get maxTemperature => details
      .map((d) => d.temperature)
      .fold(0, (previousValue, element) => max(previousValue, element));

  double get minTemperature => details
      .map((d) => d.temperature)
      .fold(0, (previousValue, element) => min(previousValue, element));

  double get avgWind => (details.map((d) => d.wind).fold<double>(
              0, (previousValue, element) => previousValue + element) /
          max(details.length, 1)) // avoid division by 0 using max function
      .roundToDouble();

  double? temperature(DateTime time) => _closer(time)?.temperature;

  double? wind(DateTime time) => _closer(time)?.wind;

  WeatherType? weatherType(DateTime time) => _closer(time)?.weatherType;

  String? weatherTypeText(DateTime time) {
    final type = weatherType(time);
    if (type == null) return null;
    return describeEnum(type);
  }

  /// Returns the most present WeatherType in the [details]
  WeatherType get avgWeatherType {
    final weatherTypeCount = {
      for (var d in details)
        d.weatherType:
            details.where((e) => e.weatherType == d.weatherType).length
    };
    var maxNb = 0;
    WeatherType? maxKey;

    weatherTypeCount.forEach((k, v) {
      if (v > maxNb) {
        maxNb = v;
        maxKey = k;
      }
    });
    return maxKey!;
  }

  /// Returns the closest WeatherDataDetail of [time]
  WeatherDataDetail? _closer(DateTime time) {
    WeatherDataDetail? closer;
    for (var i = 0; i < details.length; i++) {
      if (i == 0) {
        closer = details[i];
      } else {
        if (closer!.time.difference(time) > details[i].time.difference(time)) {
          closer = details[i];
        }
      }
    }
    return closer;
  }
}