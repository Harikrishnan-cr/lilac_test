import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_test/controller/network_connection_controller.dart';
import 'package:lilac_test/core/color/colors.dart';
import 'package:lilac_test/core/style/text_style/text_style.dart';
import 'package:lilac_test/view/home_screen/home_screen.dart';

class SplashSceen extends StatelessWidget {
  SplashSceen({super.key});

  final locationController = Get.put(NetWorkConectionController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(canvasColor: CommonAppColor.canvasColor),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: const Center(child: Text('Lilac Flutter Assignment',style: CommonTextStyle.splashSceenTextStyle,)),
            nextScreen: HomeScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.deepPurple));
  }
}
