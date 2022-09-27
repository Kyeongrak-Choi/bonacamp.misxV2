import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final admobItem = {
  Image.asset('lib/assets/images/admob_1.png', fit: BoxFit.cover),
  Image.asset('lib/assets/images/admob_2.png', fit: BoxFit.cover),
  Image.asset('lib/assets/images/admob_3.png', fit: BoxFit.cover),
};

class DashBoardAdmob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Container(
    //         alignment: Alignment.center,
    //         width: MediaQuery.of(context).size.width,
    //         height: 50,
    //         decoration: BoxDecoration(
    //           color: context.theme.canvasColor,
    //           borderRadius: BorderRadius.circular(10),
    //           shape: BoxShape.rectangle,
    //         ),
    //         child: Text(
    //           'admob_banner'.tr,
    //           textAlign: TextAlign.center,
    //           style: context.textTheme.headline3,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return CarouselSlider(
        items: admobItem.map((image) {
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
          height: 100,
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
  }
}
