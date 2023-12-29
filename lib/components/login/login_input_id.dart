import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/utils/constants.dart';

import '../../utils/theme/color_manager.dart';
import 'login_btn.dart';

class LoginInputId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginBtnController());
    return Container(
      height: 104.h,
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: CommonColors.sublogo.withOpacity(0.3),
          //     spreadRadius: 0,
          //     blurRadius: 5.0,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ]
          ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: TextFormField(
                obscureText: false,
                maxLength: 20,
                style: TextStyle(color: context.theme.focusColor, fontSize: 16.sp),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.person,
                    size: 16.sp,
                  ),
                  labelStyle: TextStyle(color: CommonColors.gray, fontSize: 16.sp),
                  //labelText: 'text_id'.tr,
                  hintText: 'text_id'.tr,
                  hintStyle: TextStyle(color: CommonColors.gray, fontSize: 16.sp),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.canvasColor,
                      width: 1,
                    ),
                    //borderRadius: BorderRadius.circular(10),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(0), top: Radius.circular(8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.canvasColor,
                      width: 1,
                    ),
                    //borderRadius: BorderRadius.circular(10),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(0), top: Radius.circular(8)),
                  ),
                  filled: true,
                  fillColor: context.theme.shadowColor,
                  contentPadding: EdgeInsets.all(24),
                  counterText: '',
                ),
                initialValue: Hive.box(LOCAL_DB).get(KEY_SAVED_ID),
                onChanged: (text) {
                  Get.find<LoginBtnController>().setInputId(text);
                },
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  maxLength: 16,
                  style: TextStyle(color: context.theme.focusColor, fontSize: 16.sp),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.lock,
                      size: 16.sp,
                    ),
                    labelStyle: TextStyle(color: CommonColors.gray,fontSize: 16.sp),
                    // labelText: 'text_pw'.tr,
                    hintText: 'text_pw'.tr,
                    hintStyle: TextStyle(color: CommonColors.gray,fontSize: 16.sp),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.theme.canvasColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8), top: Radius.circular(0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.theme.canvasColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8), top: Radius.circular(0)),
                    ),
                    filled: true,
                    fillColor: context.theme.shadowColor,
                    contentPadding: EdgeInsets.all(24),
                    counterText: '',
                  ),
                  onChanged: (text) {
                    Get.find<LoginBtnController>().setInputPw(text);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
