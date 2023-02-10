import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_test/core/fonts/fonts.dart';
import 'package:lilac_test/core/size/size.dart';

class LastWeatherTileSpecialWidget extends StatelessWidget {
  const LastWeatherTileSpecialWidget({
    Key? key,
    required this.wetherType,
    required this.height,
    required this.data,
  
  }) : super(key: key);

  final String wetherType;
  final double height;
  final String data;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          wetherType,
          style: TextStyle(
              fontFamily: humballi,
              color: Colors.white.withOpacity(0.5),
              fontSize: 18),
        ),
        constHeight(height, 0.003),
        Text(data,
            style: const TextStyle(
                fontFamily: mavenPro, color: Colors.green, fontSize: 12)),
      ],
    );
  }
}
