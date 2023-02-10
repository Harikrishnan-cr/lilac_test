
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:lilac_test/controller/home_controller.dart';
import 'package:lilac_test/controller/loacation_controller.dart';

class NetWorkConectionController extends GetxController {
  Connectivity _connectivity = Connectivity();
  final homeController = Get.put(HomeController());
  final locationController = Get.put(LocationController());
  void checkRealTimeConnection() {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        locationController.getData();
      } else if (event == ConnectivityResult.wifi) {
        locationController.getData();
      } else if (event == ConnectivityResult.none) {
        homeController.getAllWeatheDataFromDB();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    checkRealTimeConnection();
  }
}
