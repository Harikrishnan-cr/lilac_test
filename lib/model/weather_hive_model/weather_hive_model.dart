import 'dart:typed_data';
import 'package:hive_flutter/adapters.dart';
part 'weather_hive_model.g.dart';

@HiveType(typeId: 1)
class WeatherHiveModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? region;
  @HiveField(2) 
  String? country;
  @HiveField(3)
  double? lat;
  @HiveField(4)
  double? lon;
  @HiveField(5)
  String? tzId;
  @HiveField(6)
  num? localtimeEpoch;
  @HiveField(7)
  String? localtime;
  @HiveField(8)
  int? lastUpdatedEpoch;
  @HiveField(9)
  String? lastUpdated;
  @HiveField(10)
  num? tempC;
  @HiveField(11)
  double? tempF;
  @HiveField(12)
  int? isDay;
  @HiveField(13)
  double? windMph;
  @HiveField(14)
  double? windKph;
  @HiveField(15)
  num? windDegree;
  @HiveField(16)
  String? windDir;
  @HiveField(17)
  num? pressureMb;
  @HiveField(18)
  double? pressureIn;
  @HiveField(19)
  num? precipMm;
  @HiveField(20)
  num? precipIn;
  @HiveField(22)
  num? humidity;
  @HiveField(23)
  num? cloud;
  @HiveField(24)
  double? feelslikeC;
  @HiveField(25)
  double? feelslikeF;
  @HiveField(26)
  num? visKm;
  @HiveField(27)
  num? visMiles;
  @HiveField(28)
  num? uv;
  @HiveField(29)
  double? gustMph;
  @HiveField(30)
  num? gustKph;
  @HiveField(31)
  String? text;
  @HiveField(32)
  String? icon;
  @HiveField(33)
  int? code;
  @HiveField(34)
  Uint8List? imagesData;
  @HiveField(35)
  String? currentDate;

  WeatherHiveModel(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.currentDate,
      this.cloud,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.imagesData,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.feelslikeC,
      this.feelslikeF,
      this.visKm,
      this.visMiles,
      this.uv, 
      this.gustMph,
      this.gustKph,
      this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime,
      this.text,
      this.icon,
      this.code});
}
