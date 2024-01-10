import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/utils/constants.dart';

import 'login_btn.dart';

class LoginInputId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginBtnController());
    return Container(
      child: Column(
        children: [
          Container(
            //height: BASIC_PADDING * 7.h,
            child: TextFormField(
          obscureText: false,
          maxLength: 20,
          style: context.textTheme.titleSmall,
          decoration: InputDecoration(
            prefixIcon: Icon(
              CupertinoIcons.person,
              size: 16.sp,
              color: context.theme.iconTheme.color,
              // color: CommonColors.primary,
            ),
            //labelStyle: TextStyle(color: CommonColors.yellow, fontSize: 16.sp),
            //labelText: 'text_id'.tr,
            hintText: 'text_id'.tr,
            hintStyle: context.textTheme.titleSmall?.copyWith(
              color: context.theme.colorScheme.onSurfaceVariant,
            ), // font40
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.theme.canvasColor,
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(10),
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(0), top: Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.theme.canvasColor,
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(10),
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(0), top: Radius.circular(8)),
            ),
            filled: true,
            fillColor: context.theme.colorScheme.surface,
            // contentPadding: EdgeInsetsDirectional.fromSTEB(
            //     BASIC_PADDING * 3.w,
            //     BASIC_PADDING * 3.h,
            //     BASIC_PADDING * 3.w,
            //     BASIC_PADDING * 3.h),
            counterText: '',
          ),textAlignVertical: TextAlignVertical.center,
          initialValue: Hive.box(LOCAL_DB).get(KEY_SAVED_ID),
          onChanged: (text) {
            Get.find<LoginBtnController>().setInputId(text);
          },
            ),
          ),
          Divider(height: 1),
          Container(
            //height: BASIC_PADDING * 7.h,
            child: TextFormField(
              obscureText: true,
              maxLength: 16,
              style: context.textTheme.titleSmall,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.lock,
                  size: 16.sp,
                  color: context.theme.iconTheme.color,
                ),
                //labelStyle: TextStyle(color: CommonColors.gray,fontSize: 16.sp),
                // labelText: 'text_pw'.tr,
                hintText: 'text_pw'.tr,
                hintStyle: context.textTheme.titleSmall?.copyWith(
                  color: context.theme.colorScheme.onSurfaceVariant,
                ), // font40
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.theme.canvasColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(8),
                      top: Radius.circular(0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.theme.canvasColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(8),
                      top: Radius.circular(0)),
                ),
                filled: true,
                fillColor: context.theme.colorScheme.surface,
                // contentPadding: EdgeInsetsDirectional.fromSTEB(
                //     BASIC_PADDING * 3.w,
                //     BASIC_PADDING * 3.h,
                //     BASIC_PADDING * 3.w,
                //     BASIC_PADDING * 3.h),
                counterText: '',
              ),
              onChanged: (text) {
                Get.find<LoginBtnController>().setInputPw(text);
              },
            ),
          )
        ],
      ),
    );
  }
}
