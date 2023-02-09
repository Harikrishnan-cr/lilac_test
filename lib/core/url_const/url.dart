import 'package:lilac_test/core/api_key.dart';

class ConstWetherApi {
  static String constWeatherUri(String place) {
    return 'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$place&aqi=no';
  }
}
