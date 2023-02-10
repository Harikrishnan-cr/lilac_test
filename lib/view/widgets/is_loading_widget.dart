import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_test/core/color/colors.dart';
import 'package:lilac_test/core/size/size.dart';
import 'package:lilac_test/core/style/text_style/text_style.dart';
import 'package:lilac_test/model/weather_hive_model/weather_hive_model.dart';

class IsloadingWidget extends StatelessWidget {
  const IsloadingWidget({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherHiveModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          weatherData.name != null
              ? const Text(
                  'Loading.....',
                  style: CommonTextStyle.noInterntetTextStyle,
                )
              : const Text(
                  'Check your internet connection',
                  style: CommonTextStyle.noInterntetTextStyle,
                ),
          kheight10,
          const CircularProgressIndicator(
            color: CommonAppColor.gradiantColorTwo,
          ),
        ],
      ),
    );
  }
}
