import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

class DashBoardAdmob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardAdmobController());
    return GetBuilder<DashBoardAdmobController>(
        builder: (DashBoardAdmobController controller) {
      return Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  BASIC_PADDING * 2.w,
                  BASIC_PADDING * 2.h,
                  BASIC_PADDING * 2.w,
                  BASIC_PADDING * 2.h),
              child: CarouselSlider(
                  items: controller.admobItem.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          //margin: EdgeInsets.symmetric(horizontal: 15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: image,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                      height: BASIC_PADDING * 15.h,
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
                      onPageChanged: (index, reason) {
                        controller.currentIndex = index;
                        controller.update();
                      })),
            ),
            Positioned(
              bottom: 16.0.h, // 아래 여백
              left: 0.0.w, // 왼쪽 여백
              right: 0.0.w, // 오른쪽 여백
              child: DotsIndicator(
                dotsCount: controller.admobItem.length,
                position: controller.currentIndex,
                decorator: DotsDecorator(
                  color: Colors.grey,
                  activeColor: Colors.blue,
                  size: Size(4.0.w, 4.0.w),
                  activeSize: Size(16.0.w, 4.0.w),
                  spacing: EdgeInsets.all(3.0.w),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
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
