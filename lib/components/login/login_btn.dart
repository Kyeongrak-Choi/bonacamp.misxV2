import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../models/system/req_login.dart';
import '../../models/system/userinfo.dart';
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

  var dio;

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
    if (inputId == '' || inputPw == '') {
      ShowSnackBar(SNACK_TYPE.INFO, 'check_login_content'.tr);
      return false;
    } else {
      // Request Token
      if (await reqToken(true)) {
        dio = await reqLogin();
        try {
          final response = await await dio.post(API_SYSTEM_LOGIN, data: ReqLoginModel(inputId, inputPw, APP_ID).toMap());
          if (response.statusCode == 200) {
            BoxInit(); // local DB Set
            UserinfoModel userinfoModel = UserinfoModel.fromJson(response.data[TAG_DATA]);
            await Hive.box(LOCAL_DB).put(KEY_USERINFO, userinfoModel);
            await Hive.box(LOCAL_DB).put(KEY_SAVED_ID, inputId); // Id save
            inputPw = ''; // pw 초기화
            return true;
          }
        } on DioException catch (e) {
          if (e.response != null) {
            ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
            return false;
          }
        }
      } else {
        ShowSnackBar(SNACK_TYPE.ALARM, 'msg_conn_auth_server'.tr);
        return false;
      }
      return false;
    }
  }
}
