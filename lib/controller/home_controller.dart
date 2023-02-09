import 'package:get/get.dart';
import 'package:lilac_test/model/weather_model/wether_model_class.dart';
import 'package:lilac_test/services/weather_services.dart';

class HomeController extends GetxController {
  Rx<WetherModelClass> wetherData = WetherModelClass().obs;

  void getAllWeatherData() async {
    final data = await WeatherServices().getWetherApiServices(place: '');

    if (data != null) {
      wetherData.value = data; 
    }
  }


  @override
  void onInit() {
   getAllWeatherData();
    super.onInit();
  }
}
