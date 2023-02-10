import 'package:flutter/material.dart';
import 'package:lilac_test/core/fonts/fonts.dart';
import 'package:lilac_test/model/weather_hive_model/weather_hive_model.dart';

class LoactionTileWidget extends StatelessWidget {
  const LoactionTileWidget({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherHiveModel weatherData;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                fontFamily: mavenPro,
                color: Colors.white.withOpacity(0.9),
                fontSize: 23,
                fontWeight: FontWeight.bold),
            children: [
          TextSpan(text: '${weatherData.name}, '),
          TextSpan(text: weatherData.region),
        ]));
  }
}
