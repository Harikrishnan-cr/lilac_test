

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_test/controller/home_controller.dart';
import 'package:lilac_test/core/color/colors.dart';
import 'package:lilac_test/core/fonts/fonts.dart';
import 'package:lilac_test/core/size/size.dart';
import 'package:lilac_test/core/style/gradiant_style.dart';
import 'package:lilac_test/core/style/text_style/text_style.dart';
import 'package:lilac_test/model/weather_hive_model/weather_hive_model.dart';
import 'package:lilac_test/view/search_screen/search_screen.dart';




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
            
                              LocationAndDateSection(weatherData: weatherData, height: height),
             
                              constHeight(height, 0.03),
                              MainImageSectionTile(width: width, height: height, weatherData: weatherData),
            
                              constHeight(height, 0.03),
            
                              Text(
                                weatherData.text.toString(),  
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontFamily: humballi),
                              ),
                              Text(
                                '${weatherData.tempC}°',
                                style: TextStyle( 
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontFamily: humballi),
                              ),
                              constHeight(height, 0.03),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children:  [
                                  SubWeatherListWidgetTile(
                                      image: 'assets/images/wind.png',
                                      data: weatherData.windKph?.toDouble() ?? 0, 
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
            : Center(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    weatherData.name != null ? const Text('Loading.....',style: CommonTextStyle.noInterntetTextStyle,) : const Text('Check your internet connection',style: CommonTextStyle.noInterntetTextStyle,), 
                    kheight10, 
                    CircularProgressIndicator(
                      color: CommonAppColor.gradiantColorTwo, 
                    ),
            
                    
                  ],
                ),
              );
      }),  

   
    ); 
  }  
}

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
              image: MemoryImage(weatherData.imagesData!
                 ), 
              fit: BoxFit.cover)),
    );
  }
}

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
                color:
                    Colors.white.withOpacity(0.9),
                fontSize: 15,
                fontWeight: FontWeight.w500),
            children: [
          TextSpan(text: weatherData.currentDate),
      
        ]));
  }
}

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
                color:
                    Colors.white.withOpacity(0.9),
                fontSize: 23,
                fontWeight: FontWeight.bold),
            children: [
          TextSpan(
              text:
                  '${weatherData.name}, '),
          TextSpan(text: weatherData.region),
        ]));
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(()=>SearchScreen());
          },
          child: SearchTileWidget(width: width)),
        const Icon( 
          Icons.location_city,
        ),
      ],
    );
  }
}

class SearchTileWidget extends StatelessWidget {
  const SearchTileWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        width: width * 0.7,
        height: 45,
        decoration: BoxDecoration(
            color: CommonAppColor.searchTileColor,
            borderRadius:
                BorderRadius.circular(20)),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10),
              child: Icon(Icons.search),
            ),
            kWidth10,
            Text('Search weather info')
          ],
        ));
  }
}

class LastWeatherTileWidget extends StatelessWidget {
  const LastWeatherTileWidget({
    Key? key,
    required this.wetherType,
    required this.height,
    required this.data,
    required this.unit,
  }) : super(key: key);

  final String wetherType;
  final double height;
  final double data;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          wetherType,
          style: TextStyle(
              fontFamily: humballi,
              color: Colors.white.withOpacity(0.5),
              fontSize: 18),
        ),
        constHeight(height, 0.003),
        Text('$data $unit',
            style: TextStyle(
                fontFamily: mavenPro, color: Colors.white, fontSize: 16)),
      ],
    );
  }
}

class SubWeatherListWidgetTile extends StatelessWidget {
  const SubWeatherListWidgetTile({
    Key? key,
    required this.image,
    this.data,
    required this.unit,
    required this.wetherType,
  }) : super(key: key);

  final String image;
  final num? data;
  final String unit;
  final String wetherType;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(width: 23, height: 23, child: Image.asset(image)),
        constHeight(height, 0.01),
        RichText(
            text: TextSpan(
                style: TextStyle(
                    fontFamily: mavenPro,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.8)),
                children: [
              data != null ? TextSpan(text: data.toString()) : const TextSpan(),
              TextSpan(text: unit)
            ])),
        constHeight(height, 0.01),
        Text(
          wetherType,
          style: TextStyle(
              fontFamily: mavenPro,
              fontSize: 12,
              color: Colors.white.withOpacity(0.6)),
        ),
      ],
    );
  }
}

class LastWeatherTileSpecialWidget extends StatelessWidget {
  const LastWeatherTileSpecialWidget({
    Key? key,
    required this.wetherType,
    required this.height,
    required this.data,
    // required this.unit,
  }) : super(key: key);

  final String wetherType;
  final double height;
  final String data;
  // final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          wetherType,
          style: TextStyle(
              fontFamily: humballi,
              color: Colors.white.withOpacity(0.5),
              fontSize: 18),
        ),
        constHeight(height, 0.003),
        Text(data,
            style: TextStyle(
                fontFamily: mavenPro, color: Colors.green, fontSize: 12)),
      ],
    );
  }
}
