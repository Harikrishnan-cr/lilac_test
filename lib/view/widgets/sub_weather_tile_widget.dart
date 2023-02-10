



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_test/core/fonts/fonts.dart';
import 'package:lilac_test/core/size/size.dart';

class SubWeatherListWidgetTile extends StatelessWidget {
  const SubWeatherListWidgetTile({
    Key? key,
    required this.image,
    this.data,
    required this.unit,
    required this.wetherType,
  }) : super(key: key);

  final String image;
  final num? data;
  final String unit;
  final String wetherType;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(width: 23, height: 23, child: Image.asset(image)),
        constHeight(height, 0.01),
        RichText(
            text: TextSpan(
                style: TextStyle(
                    fontFamily: mavenPro,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.8)),
                children: [
              data != null ? TextSpan(text: data.toString()) : const TextSpan(),
              TextSpan(text: unit)
            ])),
        constHeight(height, 0.01),
        Text(
          wetherType,
          style: TextStyle(
              fontFamily: mavenPro,
              fontSize: 12,
              color: Colors.white.withOpacity(0.6)),
        ),
      ],
    );
  }
}

