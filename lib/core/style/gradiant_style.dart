import 'package:flutter/cupertino.dart';
import 'package:lilac_test/core/color/colors.dart';

const Gradient gradiantColor = LinearGradient(
    colors: [
      CommonAppColor.gradiantColorOne,
      CommonAppColor.gradiantColorTwo,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.2, 0.85]);
