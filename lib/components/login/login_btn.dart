import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

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
      // parameter로 prod/dev 분기
      await reqToken(false); // Token get -> true : prod / false : dev

      // login api 호출 성공시 Hive Box Init -> Id Save
      // login API process
      BoxInit(); // local DB Set
      // Id save
      await Hive.box(LOCAL_DB).put(KEY_SAVED_ID, inputId);
      inputPw = '';

      return true;
    }
  }
}
