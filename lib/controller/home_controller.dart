import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lilac_test/model/weather_hive_model/weather_hive_model.dart';
import 'package:lilac_test/services/weather_services.dart';

class HomeController extends GetxController {
  Rx<WeatherHiveModel> weatherData = WeatherHiveModel().obs;
  RxMap<String, dynamic> weatherMapData = <String, dynamic>{}.obs;
  final isLoading = true.obs;

  void getAllWeatherData() async {
    final data = await WeatherServices().getWetherApiServices(place: '');
    isLoading.value = true;
    if (data != null) {
      final currentData = data.current!;
      final locationtData = data.location!;
      final conditionData = data.current!.condition!;

      final modelData = hiveModel(
          currentData: currentData,
          locationtData: locationtData,
          conditionData: conditionData);
      addWeatherDataToDB(modelData);
    } else {
      log('unhadlesss');
      getAllWeatheDataFromDB();
    }
  }

  Future<void> addWeatherDataToDB(data) async {
    final weatherDB = await Hive.openBox<WeatherHiveModel>('weathe_db');
    weatherDB.put('key', data);
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

  @override
  void onInit() {
    getAllWeatherData();

    super.onInit();
  }

//----------search -------------------

  List<MapEntry<String, dynamic>> searchData(String searchData) {
    return weatherMapData.entries
        .where((element) =>
            element.key.toLowerCase().contains(searchData.toLowerCase()))
        .toList();
  }

  void addWeatherDataToMap(WeatherHiveModel datas) { 
    weatherMapData['Humidity'] = datas.name;
    weatherMapData['windspeed Kilometers per Hour'] = datas.region;
    weatherMapData['windspeed miles per hour'] = datas.name;
    weatherMapData['wind degree'] = datas.name;
    weatherMapData['uv'] = datas.name;
    weatherMapData['pressure'] = datas.name;
  }

  //------------add to hive model

  WeatherHiveModel hiveModel(
      {required currentData, required locationtData, required conditionData}) {
    return WeatherHiveModel(
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
        icon: conditionData.icon,
        text: conditionData.text,
        lastUpdated: currentData.lastUpdated,
        tempC: currentData.tempC,
        tempF: currentData.tempF,
        uv: currentData.uv,
        cloud: currentData.cloud);
  }
}
