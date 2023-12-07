import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme/color_manager.dart';
import '../../utils/theme/text_theme.dart';
import 'login_btn.dart';

class LoginInputPw extends StatelessWidget {
  const LoginInputPw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginBtnController());
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            obscureText: true,
            maxLength: 16,
            style: textThemeCommon().displayMedium,
            decoration: InputDecoration(
              labelStyle: textThemeCommon().displayMedium,
              labelText: 'text_pw'.tr,
              hintText: 'hint_pw_input'.tr,
              //hintStyle: TextStyle(color: CommonColors.gray),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: CommonColors.dark,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: CommonColors.dark,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
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
    );
  }
}
