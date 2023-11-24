import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardAdmob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardAdmobController());
    return GetBuilder<DashBoardAdmobController>(builder: (DashBoardAdmobController controller) {
      return CarouselSlider(
          items: Get.find<DashBoardAdmobController>().admobItem.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: image,
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 80,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ));
    });
  }
}

class DashBoardAdmobController extends GetxController {
  List<String> admobList = <String>[].obs;
  var admobItem = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setAdmodList();
  }

  void setAdmodList() {
    admobList.add('http://dionysoserp.com/download/assets/misxV2/getju_main.png');
    admobList.add('http://dionysoserp.com/download/assets/misxV2/getju_1.jpg');
    admobList.add('http://dionysoserp.com/download/assets/misxV2/getju_2.jpg');

    for (int i = 0; i < admobList.length; i++) {
      admobItem.add(Image.network(admobList[i], fit: BoxFit.cover));
    }
  }
}
