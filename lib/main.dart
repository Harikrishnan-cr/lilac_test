import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lilac_test/view/home_screen/home_screen.dart';
import 'package:lilac_test/view/splash_screen/splash_screen.dart';

void main() {
 SystemChrome.setSystemUIOverlayStyle(
   SystemUiOverlayStyle(statusBarColor: Colors.transparent)
 ); 
  runApp(const SplashSceen());
}

 