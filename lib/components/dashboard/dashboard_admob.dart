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
                  //margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: image,
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 150,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            // 비율조정
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
    admobList.add('http://dionysoserp.com/download/assets/misxV2/admob1.png');
    admobList.add('http://dionysoserp.com/download/assets/misxV2/admob2.png');
    admobList.add('http://dionysoserp.com/download/assets/misxV2/admob3.png');

    for (int i = 0; i < admobList.length; i++) {
      admobItem.add(Image.network(admobList[i], fit: BoxFit.cover));
    }
  }
}
