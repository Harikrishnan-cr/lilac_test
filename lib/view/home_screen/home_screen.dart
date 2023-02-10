// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_test/controller/home_controller.dart';
import 'package:lilac_test/core/size/size.dart';
import 'package:lilac_test/core/style/gradiant_style.dart';
import 'package:lilac_test/core/style/text_style/text_style.dart';
import 'package:lilac_test/view/sections/location_date_section.dart';
import 'package:lilac_test/view/sections/main_image_section.dart';
import 'package:lilac_test/view/sections/search_section.dart';
import 'package:lilac_test/view/widgets/is_loading_widget.dart';
import 'package:lilac_test/view/widgets/last_special_weather_tile.dart';
import 'package:lilac_test/view/widgets/last_weathe_tile_widget.dart';
import 'package:lilac_test/view/widgets/sub_weather_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());

  Uint8List? dataImages;
  @override
  Widget build(BuildContext context) {
    homeController.getAllWeatheDataFromDB();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(() {
        final weatherData = homeController.weatherData.value;
        return !homeController.isLoading.value
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.03),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: width * 0.02, right: width * 0.02),
                        width: double.infinity,
                        height: height * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: gradiantColor),
                        child: SafeArea(
                          child: Column(
                            children: [
                              SearchSection(width: width),
                              constHeight(height, 0.1),
                              LocationAndDateSection(
                                  weatherData: weatherData, height: height),
                              constHeight(height, 0.03),
                              MainImageSectionTile(
                                  width: width,
                                  height: height,
                                  weatherData: weatherData),
                              constHeight(height, 0.03),
                              Text(
                                weatherData.text.toString(),
                                style: CommonTextStyle.weatherDataTextStyle,
                              ),
                              Text(
                                '${weatherData.tempC}°',
                                style: CommonTextStyle.weatherDataTextStyle,
                              ),
                              constHeight(height, 0.03),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SubWeatherListWidgetTile(
                                      image: 'assets/images/wind.png',
                                      data:
                                          weatherData.windKph?.toDouble() ?? 0,
                                      unit: 'kh/h',
                                      wetherType: 'wind'),
                                  SubWeatherListWidgetTile(
                                      image: 'assets/images/rain.png',
                                      data: weatherData.humidity,
                                      unit: ' kh/h',
                                      wetherType: 'Humidity'),
                                  SubWeatherListWidgetTile(
                                      image: 'assets/images/wind-direction.png',
                                      unit: weatherData.windDir.toString(),
                                      wetherType: 'wind Direction'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              LastWeatherTileWidget(
                                  wetherType: 'Gust',
                                  height: height,
                                  data: weatherData.gustKph?.toDouble() ?? 0,
                                  unit: 'kh/h'),
                              LastWeatherTileWidget(
                                  wetherType: 'UV',
                                  height: height,
                                  data: weatherData.uv?.toDouble() ?? 0,
                                  unit: 'uv'),
                              LastWeatherTileWidget(
                                  wetherType: 'Wind',
                                  height: height,
                                  data: weatherData.windKph?.toDouble() ?? 0,
                                  unit: 'kh/h'),
                            ],
                          ),
                          constHeight(height, 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              LastWeatherTileWidget(
                                  wetherType: 'Pressure',
                                  height: height,
                                  data: weatherData.pressureMb?.toDouble() ?? 0,
                                  unit: 'hpa'),
                              LastWeatherTileWidget(
                                  wetherType: 'Precipitation',
                                  height: height,
                                  data: weatherData.precipMm?.toDouble() ?? 0,
                                  unit: 'mm'),
                              LastWeatherTileSpecialWidget(
                                wetherType: 'Latest Update',
                                height: height,
                                data: weatherData.lastUpdated.toString(),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            : IsloadingWidget(weatherData: weatherData);
      }),
    );
  }
}
