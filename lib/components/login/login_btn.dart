import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/utils/snackbar.dart';
import '../../utils/constants.dart';

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
                    Get.toNamed('/navigation');
                  } else {
                    ShowSnackBar('a', 'check_login_content'.tr);
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
  var inputId;
  var inputPw;
  var systemBox = Hive.box('SYSTEM');

  @override
  void onInit() {
    super.onInit();
    inputId = systemBox.get('savedId', defaultValue: '');
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
      // id save
      await systemBox.put('savedId', inputId);
      inputPw = '';

      // login API process

      return true;
    }
  }
}
