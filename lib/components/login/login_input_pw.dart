import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/theme/color_manager.dart';
import '../../utils/theme/text_theme.dart';
import 'login_btn.dart';

class LoginInputPw extends StatelessWidget {
  const LoginInputPw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginBtnController());
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
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
              obscureText: true,
              maxLength: 16,
              style: TextStyle(color: CommonColors.gray,fontSize: 16.sp),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline_rounded),
                labelStyle: TextStyle(color: CommonColors.gray),
               // labelText: 'text_pw'.tr,
                hintText: 'text_pw'.tr,
                hintStyle: TextStyle(color: CommonColors.gray),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CommonColors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10),top: Radius.circular(0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CommonColors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10),top: Radius.circular(0)),
                ),
                filled: true,
                fillColor: CommonColors.white,
                contentPadding: EdgeInsets.all(20),
                counterText: '',
              ),
              onChanged: (text) {
                Get.find<LoginBtnController>().setInputPw(text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
