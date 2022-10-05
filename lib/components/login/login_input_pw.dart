import 'package:flutter/cupertino.dart';
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
            style: textThemeCommon().headline3,
            decoration: InputDecoration(
              labelStyle: textThemeCommon().headline3,
              labelText: 'text_pw'.tr,
              hintText: 'hint_pw_input'.tr,
              hintStyle: TextStyle(color: CommonColors.common_dark),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: CommonColors.common_dark,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: CommonColors.common_dark,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: CommonColors.common_bluesky,
              contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
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
