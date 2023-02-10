import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lilac_test/controller/home_controller.dart';

class LocationController extends GetxController{
String location = '';
 bool isPermisonAllowed = false;
 
  
  //final homeController = Get.put(HomeController());
  Future<Position> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        '');
  }
  
  return await Geolocator.getCurrentPosition();
}


final homeController = Get.put(HomeController()); 


 convertLocation({required Position data})async{



List<Placemark> placemarks = await placemarkFromCoordinates(data.latitude,data.longitude); 

final val = placemarks[0];   
   
log('${val.locality}') ;   log(val.toString()); 
// notifyListeners();   

 location = val.locality!; 

 homeController.getAllWeatherData(location);  


 

} 
Position? locationGioData;

void getData()async{
 locationGioData = await getLocation();

 if(locationGioData != null){
convertLocation(data: locationGioData!); 


 }
  
 log(locationGioData.toString());   
}

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}