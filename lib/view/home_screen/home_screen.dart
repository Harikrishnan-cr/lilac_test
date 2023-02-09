import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_test/controller/home_controller.dart';
import 'package:lilac_test/core/style/gradiant_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              width: double.infinity,
              height: height * 0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: gradiantColor),
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
