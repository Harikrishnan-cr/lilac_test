import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:lilac_test/core/url_const/url.dart';
import 'package:lilac_test/model/weather_model/wether_model_class.dart';

class WeatherServices {
  Future<WetherModelClass?> getWetherApiServices(
      {required String place}) async {
    final responce =
        await http.get(Uri.parse(ConstWetherApi.constWeatherUri('London')));
    try {
      if (responce.statusCode == 200) {
        final data = jsonDecode(responce.body);
        log(data.toString());
        return WetherModelClass.fromJson(data);
      } else {
        log('not gettibg');
      }
    } catch (e) {
      log('eeeeeeeeeeeee error'); 
      log(e.toString());
    }
    return null;
  }
}
