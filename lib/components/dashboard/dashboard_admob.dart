import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardAdmob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardAdmobController());
    return GetBuilder<DashBoardAdmobController>(builder: (DashBoardAdmobController controller) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        child: Column(
          children: [
            CarouselSlider(
                items: controller.admobItem.map((image) {
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
                  height: MediaQuery.of(context).size.height / 5,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  // 비율조정
                  initialPage: controller.currentIndex,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index,reason){
                    controller.currentIndex = index;
                    controller.update();
                  }
                )),
            DotsIndicator(
              dotsCount: controller.admobItem.length,
              position: controller.currentIndex,
              decorator: DotsDecorator(
                color: Colors.grey[300]!,
                activeColor: Colors.blue,
                size: Size(10.0, 10.0),
                activeSize: Size(20.0, 10.0),
                spacing: EdgeInsets.all(3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class DashBoardAdmobController extends GetxController {
  List<String> admobList = <String>[].obs;
  var admobItem = [];
  var currentIndex;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setAdmodList();
    currentIndex = 0;
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
