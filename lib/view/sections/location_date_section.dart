import 'package:flutter/cupertino.dart';
import 'package:lilac_test/core/size/size.dart';
import 'package:lilac_test/model/weather_hive_model/weather_hive_model.dart';
import 'package:lilac_test/view/widgets/current_date_tile_widget.dart';
import 'package:lilac_test/view/widgets/location_tile_widget.dart';

class LocationAndDateSection extends StatelessWidget {
  const LocationAndDateSection({
    Key? key,
    required this.weatherData,
    required this.height,
  }) : super(key: key);

  final WeatherHiveModel weatherData;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoactionTileWidget(weatherData: weatherData),
        constHeight(height, 0.01),
        CurrentDateTileWidget(weatherData: weatherData),
      ],
    );
  }
}
