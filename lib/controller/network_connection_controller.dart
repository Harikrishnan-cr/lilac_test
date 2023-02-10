import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:lilac_test/controller/home_controller.dart';
import 'package:lilac_test/controller/loacation_controller.dart';

class NetWorkConectionController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  final homeController = Get.put(HomeController());
  final locationController = Get.put(LocationController());
  late StreamSubscription streamSubscription;
  void checkRealTimeConnection() {
    streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
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
  void onClose() {
    super.onClose();

    streamSubscription.cancel();
  }

  @override
  void onInit() {
    super.onInit();
    checkRealTimeConnection();
  }
}
