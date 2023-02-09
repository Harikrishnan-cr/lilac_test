import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_test/controller/home_controller.dart';
import 'package:lilac_test/core/fonts/fonts.dart';
import 'package:lilac_test/core/size/size.dart';
import 'package:lilac_test/core/style/gradiant_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());
  final degree = '9.0°';
  final data = 19.1;
  final unit = 'Kh/h';
  final image = 'assets/images/wind.png';
  final wetherType = 'wind';
  final weatherImage = 'cdn.weatherapi.com/weather/64x64/day/122.png';
  @override
  Widget build(BuildContext context) {
    homeController.getAllWeatheDataFromDB(); 
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Obx( 
           () {
            return !homeController.isLoading.value ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.03),
                  child: Container(
                    margin:
                        EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                    width: double.infinity,
                    height: height * 0.75, 
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: gradiantColor),
                    child: SafeArea(
                      child: Column(
                        children: [
                          //Text('CCCCCCCCCCCC',style: TextStyle(fontSize: 25,fontFamily: mavenPro),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  width: width * 0.7,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(149, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Icon(Icons.search),
                                      ),
                                     kWidth10,
                                      Text('Search other data')
                                    ],
                                  )),
                              Icon(
                                Icons.location_city,
                              ),
                            ],
                          ),

                          constHeight(height, 0.1),

                          Column(
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontFamily: mavenPro,  
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    TextSpan(text: '${homeController.wetherData.value.name}, '),
                                    TextSpan(text: 'Kerala'),
                                  ])),
                              constHeight(height, 0.01),
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontFamily: mavenPro,
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      children: [
                                    TextSpan(text: 'Monday, '),
                                    TextSpan(text: '03 March'),
                                  ])),
                            ],
                          ),

                          constHeight(height, 0.03),
                          Container(
                            width: width * 0.4,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('http://$weatherImage'),
                                    fit: BoxFit.cover)),
                          ),

                          constHeight(height, 0.03),

                          Text(
                            'Cloudy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 40,
                                fontFamily: humballi),
                          ),
                          Text(
                            degree,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 40,
                                fontFamily: humballi),
                          ),
                          constHeight(height, 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              SubWeatherListWidgetTile(
                                  image: 'assets/images/wind.png',
                                  data: 19.1,
                                  unit: 'kh/h',
                                  wetherType: 'wind'),
                              SubWeatherListWidgetTile(
                                  image: 'assets/images/rain.png',
                                  data: 19.1,
                                  unit: 'kh/h',
                                  wetherType: 'Humidity'),
                              SubWeatherListWidgetTile(
                                  image: 'assets/images/wind-direction.png',
                                  unit: 'SW',
                                  wetherType: 'wind Direction'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),


 Padding(
   padding:  EdgeInsets.only(top: height*0.02),
   child: Column(
    
    children: [
            Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [ 
            LastWeatherTileWidget(wetherType: 'Gust', height: height, data: data, unit: unit), 
            LastWeatherTileWidget(wetherType: 'UV', height: height, data: 1.0, unit: 'uv'),  
            LastWeatherTileWidget(wetherType: 'Wind', height: height, data: data, unit: unit), 
      ],
     ),
    constHeight(height, 0.02),
       Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [ 
            LastWeatherTileWidget(wetherType: 'Pressure', height: height, data: 1025.0, unit: 'hpa'), 
            LastWeatherTileWidget(wetherType: 'Precipitation', height: height, data: 0.0, unit: 'mm'), 
            LastWeatherTileSpecialWidget(wetherType: 'Latest Update', height: height, data: '2022-03-20', unit: '21:30'), 
      ],
     )
    ],
   ),  
 )
              ],
            ) : Center(child: CircularProgressIndicator(),); 
          }
        ),
      ),
    );
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
        Text(wetherType,style: TextStyle(fontFamily: humballi,color: Colors.white.withOpacity(0.5),fontSize: 18),),

        constHeight(height, 0.003),
        Text('$data $unit',style: TextStyle(fontFamily: mavenPro,color: Colors.white,fontSize: 16)),
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
    required this.unit,
  }) : super(key: key);

  final String wetherType;
  final double height;
  final String data;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column( 
      children: [
        Text(wetherType,style: TextStyle(fontFamily: humballi,color: Colors.white.withOpacity(0.5),fontSize: 18),),

        constHeight(height, 0.003),
        Text('$data $unit',style: TextStyle(fontFamily: mavenPro,color: Colors.green,fontSize: 12)),
      ],
    );
  }
}