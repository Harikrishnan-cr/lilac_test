import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:lilac_test/model/weather_hive_model/weather_hive_model.dart';
import 'package:lilac_test/services/save_image_services.dart';
import 'package:lilac_test/services/weather_services.dart';

class HomeController extends GetxController {
  Rx<WeatherHiveModel> weatherData = WeatherHiveModel().obs;
  RxMap<String, dynamic> weatherMapData = <String, dynamic>{}.obs;
  final isLoading = true.obs;
final searchInputController = TextEditingController();  
  List<MapEntry<String, dynamic>> mapData = [];  

  void getAllWeatherData(String place) async {
    log('$place ----------------------------------');
    final data = await WeatherServices().getWetherApiServices(place: place);
    isLoading.value = true;
    if (data != null) {
      final currentData = data.current!;
      final locationtData = data.location!;
      final conditionData = data.current!.condition!;
      final imageData = await saveImageToHive('https:${conditionData.icon}');
      final modelData = hiveModel(
          imageData: imageData,
          currentData: currentData,
          locationtData: locationtData,
          conditionData: conditionData);

      await addWeatherDataToDB(modelData);
    } else {
      Get.snackbar('Error', 'No Data available for the current location');
      log('unhadlesss');

      getAllWeatheDataFromDB();
    }
  }

  Future<void> addWeatherDataToDB(data) async {
    final weatherDB = await Hive.openBox<WeatherHiveModel>('weathe_db');
    weatherDB.put('key', data);
    getAllWeatheDataFromDB();
  }

  void getAllWeatheDataFromDB() async {
    isLoading.value = true;
    final weatherDB = await Hive.openBox<WeatherHiveModel>('weathe_db');

    final datas = weatherDB.get('key');

    if (datas != null) {
      weatherData.value = datas;
      addWeatherDataToMap(datas);
      isLoading.value = false;
    } else {
      return;
    }
  }




  // @override
  // void onInit() {

  //   super.onInit();
  // }

//----------search -------------------

  void searchData(String searchData) {
 
    mapData = weatherMapData.entries
        .where((element) =>
            element.key.toLowerCase().contains(searchData.toLowerCase()))
        .toList();

        update(); 
  }

  void addWeatherDataToMap(WeatherHiveModel datas) {
    weatherMapData['Humidity'] = datas.humidity;
    weatherMapData['windspeed Kp/h'] = datas.windKph;
    weatherMapData['windspeed mp/h'] = datas.windMph; 
    weatherMapData['wind degree'] = datas.windDegree;
    weatherMapData['uv'] = datas.uv;
    weatherMapData['pressure hpa'] = datas.pressureMb; 
  }

  //------------add to hive model

  WeatherHiveModel hiveModel(
      {required currentData,
      required locationtData,
      required conditionData,
      required Uint8List imageData}) {
        
    final data = DateTime.now(); 
 final dateFormated = DateFormat("d MMMM, y").format(data);    
 log(dateFormated.toString()); 
    log(data.day.toString()); 
    return WeatherHiveModel(
      currentDate: dateFormated, 
        windDegree: currentData.windDegree,
        windDir: currentData.windDir,
        windKph: currentData.windKph,
        windMph: currentData.windMph,
        isDay: currentData.isDay,
        localtime: locationtData.localtime,
        name: locationtData.name,
        region: locationtData.region,
        country: locationtData.country,
        humidity: currentData.humidity,
        gustKph: currentData.gustKph,
        gustMph: currentData.gustMph,
        precipIn: currentData.precipIn,
        precipMm: currentData.precipMm,
        pressureIn: currentData.pressureIn,
        pressureMb: currentData.pressureMb,
        icon: imageData.toString(),
        imagesData: imageData,
        text: conditionData.text,
        lastUpdated: currentData.lastUpdated,
        tempC: currentData.tempC,
        tempF: currentData.tempF,
        uv: currentData.uv,
        cloud: currentData.cloud);
  }
}
