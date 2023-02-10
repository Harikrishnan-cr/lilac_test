import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_test/controller/home_controller.dart';
import 'package:lilac_test/core/color/colors.dart';
import 'package:lilac_test/core/size/size.dart';
import 'package:lilac_test/core/style/text_style/text_style.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    homeController.mapData = [];
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(null),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.close)),
          kWidth20,
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: homeController.searchInputController,
              onChanged: (value) {
                homeController.searchData(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                filled: true,
                fillColor: CommonAppColor.searchTileColor,
                hintText: 'Search weather info',
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<HomeController>(builder: (controler) {
              return ListView.builder(
                itemCount: controler.mapData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: CommonAppColor.gradiantColorTwo,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30, bottom: 30, left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controler.mapData[index].key} : ',
                              style: CommonTextStyle.searchFeildTextStyle,
                            ),
                            Text(
                              '${controler.mapData[index].value}',
                              style: CommonTextStyle.searchFeildTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
