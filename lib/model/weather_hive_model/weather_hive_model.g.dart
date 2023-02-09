// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherHiveModelAdapter extends TypeAdapter<WeatherHiveModel> {
  @override
  final int typeId = 1;

  @override
  WeatherHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherHiveModel(
      lastUpdatedEpoch: fields[8] as int?,
      lastUpdated: fields[9] as String?,
      tempC: fields[10] as num?,
      tempF: fields[11] as double?,
      isDay: fields[12] as int?,
      windMph: fields[13] as double?,
      windKph: fields[14] as double?,
      windDegree: fields[15] as num?,
      windDir: fields[16] as String?,
      pressureMb: fields[17] as num?,
      pressureIn: fields[18] as double?,
      precipMm: fields[19] as num?,
      precipIn: fields[20] as num?,
      humidity: fields[22] as num?,
      cloud: fields[23] as num?,
      feelslikeC: fields[24] as double?,
      feelslikeF: fields[25] as double?,
      visKm: fields[26] as num?,
      visMiles: fields[27] as num?,
      uv: fields[28] as num?,
      gustMph: fields[29] as double?,
      gustKph: fields[30] as num?,
      name: fields[0] as String?,
      region: fields[1] as String?,
      country: fields[2] as String?,
      lat: fields[3] as double?,
      lon: fields[4] as double?,
      tzId: fields[5] as String?,
      localtimeEpoch: fields[6] as num?,
      localtime: fields[7] as String?,
      text: fields[31] as String?,
      icon: fields[32] as String?,
      code: fields[33] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherHiveModel obj) {
    writer
      ..writeByte(33)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.region)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.lat)
      ..writeByte(4)
      ..write(obj.lon)
      ..writeByte(5)
      ..write(obj.tzId)
      ..writeByte(6)
      ..write(obj.localtimeEpoch)
      ..writeByte(7)
      ..write(obj.localtime)
      ..writeByte(8)
      ..write(obj.lastUpdatedEpoch)
      ..writeByte(9)
      ..write(obj.lastUpdated)
      ..writeByte(10)
      ..write(obj.tempC)
      ..writeByte(11)
      ..write(obj.tempF)
      ..writeByte(12)
      ..write(obj.isDay)
      ..writeByte(13)
      ..write(obj.windMph)
      ..writeByte(14)
      ..write(obj.windKph)
      ..writeByte(15)
      ..write(obj.windDegree)
      ..writeByte(16)
      ..write(obj.windDir)
      ..writeByte(17)
      ..write(obj.pressureMb)
      ..writeByte(18)
      ..write(obj.pressureIn)
      ..writeByte(19)
      ..write(obj.precipMm)
      ..writeByte(20)
      ..write(obj.precipIn)
      ..writeByte(22)
      ..write(obj.humidity)
      ..writeByte(23)
      ..write(obj.cloud)
      ..writeByte(24)
      ..write(obj.feelslikeC)
      ..writeByte(25)
      ..write(obj.feelslikeF)
      ..writeByte(26)
      ..write(obj.visKm)
      ..writeByte(27)
      ..write(obj.visMiles)
      ..writeByte(28)
      ..write(obj.uv)
      ..writeByte(29)
      ..write(obj.gustMph)
      ..writeByte(30)
      ..write(obj.gustKph)
      ..writeByte(31)
      ..write(obj.text)
      ..writeByte(32)
      ..write(obj.icon)
      ..writeByte(33)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
