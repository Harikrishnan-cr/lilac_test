import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_test/controller/home_controller.dart';
import 'package:lilac_test/services/weather_services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Obx(() {
        return Column(
          children: [
            Text(homeController.wetherData.value.current!.cloud.toString())
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          WeatherServices().getWetherApiServices(place: 'place');
        },
      ),
    );
  }
}
