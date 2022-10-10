import 'dart:math';

import 'package:ecommerse/custom_practice/weather/model/weather_data.dart';
import 'package:ecommerse/custom_practice/weather/model/weather_data_detail.dart';
import 'package:ecommerse/custom_practice/weather/model/weather_type.dart';

class SampleDataGenerator {
  /// Get randomly generated weather data
  ///
  /// [todayWeatherType] is today's WeatherType and is not randomized for
  /// testing purposes
  static List<WeatherData> getData({WeatherType? todayWeatherType}) {
    final now = DateTime.now();
    final rand = Random();
    final data = <WeatherData>[
      WeatherData(
          date: now,
          sunrise: DateTime(now.year, now.month, now.day, 6, 50, 0),
          sunset: DateTime(now.year, now.month, now.day, 19, 20, 0),
          details: [
            for (int h = 0; h < 24; h++)
              WeatherDataDetail(
                  temperature: 18.0 +
                      (h > 12 ? 0.3 * (12 - h) : -0.3 * (12 - h)).round(),
                  wind: 11 + rand.nextInt(10) * (rand.nextBool() ? -1 : 1),
                  time: DateTime(now.year, now.month, now.day, h),
                  weatherType: todayWeatherType ?? WeatherType.sunny)
          ]),
    ];

    for (var i = 0; i < 5; i++) {
      data.add(WeatherData(
          date: now.add(Duration(days: i + 1)),
          sunrise: DateTime(now.year, now.month, now.day, 6, 60, 0)
              .add(Duration(days: i + 1)),
          sunset: DateTime(now.year, now.month, now.day, 19, 20, 0)
              .add(Duration(days: i + 1)),
          details: [
            for (int h = 0; h < 24; h++)
              WeatherDataDetail(
                  temperature: 10.0 +
                      rand.nextInt(10) +
                      (h > 12 ? 0.3 * (12 - h) : -0.3 * (12 - h)).round(),
                  wind: 11 + rand.nextInt(10) * (rand.nextBool() ? -1 : 1),
                  time: DateTime(now.year, now.month, now.day, h)
                      .add(Duration(days: i + 1)),
                  weatherType: WeatherType
                      .values[rand.nextInt(WeatherType.values.length)])
          ]));
    }
    return data;
  }
}