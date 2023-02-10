import 'package:flutter/material.dart';
import 'package:lilac_test/core/fonts/fonts.dart';
import 'package:lilac_test/model/weather_hive_model/weather_hive_model.dart';

class CurrentDateTileWidget extends StatelessWidget {
  const CurrentDateTileWidget({
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
                fontSize: 15,
                fontWeight: FontWeight.w500),
            children: [
          TextSpan(text: weatherData.currentDate),
        ]));
  }
}
