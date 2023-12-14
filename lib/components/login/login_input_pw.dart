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
            style: textThemeCommon().titleLarge,
            decoration: InputDecoration(
              labelStyle: textThemeCommon().titleMedium,
             // labelText: 'text_pw'.tr,
              hintText: 'text_pw'.tr,
              hintStyle: TextStyle(color: CommonColors.gray),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: CommonColors.signature,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: CommonColors.signature,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: false,
              fillColor: CommonColors.bluesky,
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
