import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/models/token/req_token.dart';

import '../../models/system/req_login.dart';
import '../../utils/constants.dart';
import '../../utils/database/hive_manager.dart';
import '../../utils/network/network_manager.dart';
import '../../utils/theme/color_manager.dart';
import '../../utils/utility.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginBtnController());
    Get.put(NetworkManager());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () async {
                  if (await Get.find<LoginBtnController>().LoginCheck()) {
                    Get.toNamed(ROUTE_NATIGATION);
                  } else {
                    ShowSnackBar(SNACK_TYPE.ALARM, 'check_login_content'.tr);
                  }
                },
                child: Text('text_login'.tr),
                style: ElevatedButton.styleFrom(
                  foregroundColor: CommonColors.white,
                  backgroundColor: CommonColors.dark,
                )))
      ],
    );
  }
}

class LoginBtnController extends GetxController {
  var inputId;
  var inputPw;

  @override
  void onInit() {
    super.onInit();
    inputId = Hive.box(LOCAL_DB).get(KEY_SAVED_ID);
    inputPw = '';
  }

  void setInputId(text) {
    inputId = text;
  }

  void setInputPw(text) {
    inputPw = text;
  }

  Future<bool> LoginCheck() async {
    if (inputId == "" || inputPw == "") {
      return false;

    } else {
      // Request Token
      if(await reqToken(true)){ // parameter로 prod/dev 분기 Token get -> true : dev / false : prod
        await Hive.box(LOCAL_DB).put(KEY_SAVED_ID, inputId); // Id save

        String result = await Get.find<NetworkManager>().requestApi(API_SYSTEM_LOGIN
            ,  ReqLoginModel(inputId,inputPw,APP_ID).toMap()
            , API_REQ_POST );
        log('result : ' + result);

        if(result =='200'){
          // login success
          inputPw = ''; // pw 초기화
          return true;
        }else{
          // login fail
          return false;
        }
        //BoxInit(); // local DB Set  -> 나중에

      }else {
        log('login check fail');
        return false;
      }
    }
  }
}
