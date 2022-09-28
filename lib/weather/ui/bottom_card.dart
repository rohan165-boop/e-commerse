
import 'package:ecommerse/weather/assets_path.dart';
import 'package:ecommerse/weather/model/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomCard extends StatelessWidget {
  final List<WeatherData> weatherData;

  const BottomCard({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todayWeather = weatherData.first;
    final textTheme = Theme.of(context).textTheme;
    final hourFormat = DateFormat.Hm();
    final dayFormat = DateFormat.EEEE();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'TODAY',
                style: textTheme.subtitle2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${todayWeather.maxTemperature}°',
                          style: textTheme.headline6,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${todayWeather.minTemperature}°',
                          style: textTheme.subtitle2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.air_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('${todayWeather.avgWind} km/h')
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: Row(children: [
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: todayWeather.details.length,
                          itemBuilder: (buildContext, index) {
                            final weatherDetail = todayWeather.details[index];
                            return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    Text(hourFormat.format(weatherDetail.time)),
                                    Image.asset(
                                      AssetPath.weatherAsset(
                                          weatherDetail.weatherType),
                                      width: 32,
                                      height: 32,
                                    ),
                                    Text('${weatherDetail.temperature}°'),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.air_outlined,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '${weatherDetail.wind} km/h',
                                          style: textTheme.caption,
                                        )
                                      ],
                                    ),
                                  ],
                                ));
                          }))
                ]),
              ),
              Text(
                '5 NEXT DAYS',
                style: textTheme.subtitle2,
              ),
              SizedBox(
                height: 100,
                child: Row(children: [
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: weatherData.length - 1, // skip today
                          itemBuilder: (buildContext, index) {
                            // index + 1 since weatherData[0] is today
                            final weatherDay = weatherData[index + 1];
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Text(dayFormat.format(weatherDay.date)),
                                  Image.asset(
                                    AssetPath.weatherAsset(
                                        weatherDay.avgWeatherType),
                                    width: 32,
                                    height: 32,
                                  ),
                                  Row(children: [
                                    Text('${weatherDay.maxTemperature}°'),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text('${weatherDay.minTemperature}°')
                                  ]),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.air_outlined,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '${weatherDay.avgWind} km/h',
                                        style: textTheme.caption,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }))
                ]),
              ),
            ],
          )),
    );
  }
}
