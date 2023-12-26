import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/utils/constants.dart';

import '../../utils/theme/color_manager.dart';
import '../../utils/theme/text_theme.dart';
import 'login_btn.dart';

class LoginInputId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginBtnController());
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: CommonColors.sublogo.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 5.0,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: TextFormField(
            obscureText: false,
            maxLength: 16,
            style: TextStyle(color: context.theme.focusColor, fontSize: 16.sp),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_2_outlined),
              labelStyle: TextStyle(color: CommonColors.gray),
              //labelText: 'text_id'.tr,
              hintText: 'text_id'.tr,
              hintStyle: TextStyle(color: CommonColors.gray),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: CommonColors.white,
                  width: 1,
                ),
                //borderRadius: BorderRadius.circular(10),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(0),top: Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: CommonColors.white,
                  width: 1,
                ),
                //borderRadius: BorderRadius.circular(10),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(0),top: Radius.circular(10)),
              ),
              filled: true,
              fillColor: context.theme.shadowColor,
              contentPadding: EdgeInsets.all(20),
              counterText: '',
            ),
            initialValue: Hive.box(LOCAL_DB).get(KEY_SAVED_ID),
            onChanged: (text) {
              Get.find<LoginBtnController>().setInputId(text);
            },
          )),
        ],
      ),
    );
  }
}
