import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_test/view/search_screen/search_screen.dart';
import 'package:lilac_test/view/widgets/search_tile_widget.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
            onTap: () {
              Get.to(() => SearchScreen());
            },
            child: SearchTileWidget(width: width)),
        const Icon(
          Icons.location_city,
        ),
      ],
    );
  }
}
