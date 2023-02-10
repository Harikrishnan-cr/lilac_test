import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lilac_test/model/weather_hive_model/weather_hive_model.dart';
import 'package:lilac_test/view/splash_screen/splash_screen.dart';

Future<void> main() async{ 
WidgetsFlutterBinding.ensureInitialized();
 SystemChrome.setSystemUIOverlayStyle(
   SystemUiOverlayStyle(statusBarColor: Colors.transparent)
 ); 
await Hive.initFlutter();
if(!Hive.isAdapterRegistered(WeatherHiveModelAdapter().typeId)){
  Hive.registerAdapter(WeatherHiveModelAdapter()); 
}
  runApp( SplashSceen()); 
}

 