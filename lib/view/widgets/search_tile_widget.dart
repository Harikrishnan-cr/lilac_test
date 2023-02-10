

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_test/core/color/colors.dart';
import 'package:lilac_test/core/size/size.dart';

class SearchTileWidget extends StatelessWidget {
  const SearchTileWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        width: width * 0.7,
        height: 45,
        decoration: BoxDecoration(
            color: CommonAppColor.searchTileColor,
            borderRadius:
                BorderRadius.circular(20)),
        child: Row(
          children: const [
            Padding(
              padding:
                   EdgeInsets.only(left: 10),
              child: Icon(Icons.search),
            ),
            kWidth10,
            Text('Search weather info')
          ],
        ));
  }
}