import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_test/core/color/colors.dart';
import 'package:lilac_test/view/home_screen/home_screen.dart';

class SplashSceen extends StatelessWidget {
  const SplashSceen({super.key});

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
