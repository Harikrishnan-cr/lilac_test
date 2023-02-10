import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_test/core/fonts/fonts.dart';
import 'package:lilac_test/view/splash_screen/splash_screen.dart';

class CommonTextStyle {
  static const noInterntetTextStyle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white);

  static const searchFeildTextStyle = TextStyle(
      fontFamily: humballi, fontWeight: FontWeight.bold, fontSize: 25);
  static const weatherDataTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 40,
      fontFamily: humballi);
      static const splashSceenTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 30,
      fontFamily: humballi);
}
