import 'package:flutter/cupertino.dart';
import 'package:lilac_test/model/weather_hive_model/weather_hive_model.dart';

class MainImageSectionTile extends StatelessWidget {
  const MainImageSectionTile({
    Key? key,
    required this.width,
    required this.height,
    required this.weatherData,
  }) : super(key: key);

  final double width;
  final double height;
  final WeatherHiveModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      height: height * 0.1,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: MemoryImage(weatherData.imagesData!), fit: BoxFit.cover)),
    );
  }
}
