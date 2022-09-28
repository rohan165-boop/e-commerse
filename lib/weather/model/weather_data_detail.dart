import 'package:ecommerse/weather/model/weather_type.dart';

class WeatherDataDetail {
  final double temperature;
  final double wind;
  final DateTime time;
  final WeatherType weatherType;

  WeatherDataDetail({
    required this.temperature,
    required this.wind,
    required this.time,
    required this.weatherType,
  });
}