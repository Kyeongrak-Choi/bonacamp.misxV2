import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/constants.dart';
import '../../layouts/navigation.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginBtnController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  if(Get.find<LoginBtnController>().LoginCheck()){
                    Get.to(Navigation());
                  }else{
                    Get.snackbar(
                      'check_login_header'.tr,
                      'check_login_content'.tr,
                      snackPosition: SnackPosition.TOP,
                      forwardAnimationCurve: Curves.elasticInOut,
                      reverseAnimationCurve: Curves.easeOut,
                      backgroundColor: Colors.white,
                      colorText: Color(AppColor),
                    );
                  }
                },
                child: Text('text_login'.tr),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(AppColor),
                )))
      ],
    );
  }
}

class LoginBtnController extends GetxController {
  var inputId="";
  var inputPw="";

  LoginCheck(){
    if(inputId=="" ||inputPw==""){
      return false;
    }else{
      // 로그인 API 처리
      inputId ="";
      inputPw ="";

      return true;
    }
  }
}
