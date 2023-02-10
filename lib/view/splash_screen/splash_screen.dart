import 'dart:developer';

import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lilac_test/controller/loacation_controller.dart';
import 'package:lilac_test/controller/network_connection_controller.dart';
import 'package:lilac_test/core/color/colors.dart';
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
            splash: Icons.home,
            nextScreen: HomeScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.blue));
  }
}



