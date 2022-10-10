import 'package:ecommerse/custom_practice/weather/model/weather_type.dart';

class AssetPath {
  static const moon = 'assets/icons/moon.png';
  static const cloud1 = 'assets/icons/cloud1.png';
  static const cloud2 = 'assets/icons/cloud2.png';
  static const cloud3 = 'assets/icons/cloud3.png';

  static const sunny = 'assets/icons/sunny.png';
  static const cloudy = 'assets/icons/cloudy.png';
  static const rainy = 'assets/icons/rainy.png';
  static const snowy = 'assets/icons/snowy.png';

  /// Retrieves the weather asset based on the [weatherType]
  static String weatherAsset(WeatherType weatherType) {
    switch (weatherType) {
      case WeatherType.cloudy:
        return AssetPath.cloudy;
      case WeatherType.sunny:
        return AssetPath.sunny;
      case WeatherType.rainy:
        return AssetPath.rainy;
      case WeatherType.snowy:
        return AssetPath.snowy;
    }
  }
}