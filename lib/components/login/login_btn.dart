import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../models/system/req_login.dart';
import '../../utils/constants.dart';
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
            child: Container(
              height: 50,
              child: ElevatedButton(
                  onPressed: () async {
                    ProgressDialog pd = ProgressDialog(context: context);
                    pd.show(max: 100, msg: 'progress_login'.tr, backgroundColor: CommonColors.bluesky);
                    if (await Get.find<LoginBtnController>().LoginCheck()) {
                      pd.close();
                      Get.toNamed(ROUTE_NATIGATION);
                    }
                    pd.close();
                  },
                  child: Text('text_login'.tr),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: CommonColors.white,
                    backgroundColor: CommonColors.dark,
                  )),
            ))
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
    // test login
    inputId = 'misxdev';
    inputPw = 'misxdev';

    if (inputId == '' || inputPw == '') {
      return false;
    } else {
      // Request Token
      if (await reqToken(true)) {
        // parameter로 prod/dev 분기 Token get -> true : dev / false : prod
        var res = await reqLogin(ReqLoginModel(inputId, inputPw, APP_ID).toMap());
        if (res == '200') {
          await Hive.box(LOCAL_DB).put(KEY_SAVED_ID, inputId); // Id save
          inputPw = ''; // pw 초기화
          return true;
        } else if (res == '401') {
          ShowSnackBar(SNACK_TYPE.ALARM, 'msg_api_401'.tr);
          return false;
        } else if (res == '500') {
          ShowSnackBar(SNACK_TYPE.ALARM, 'msg_api_500'.tr);
          return false;
        } else {
          ShowSnackBar(SNACK_TYPE.ALARM, 'msg_conn_api_server'.tr);
          return false;
        }
      } else {
        ShowSnackBar(SNACK_TYPE.ALARM, 'msg_conn_auth_server'.tr);
        return false;
      }
    }
  }
}
