import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/utils/constants.dart';

import '../../utils/theme/text_theme.dart';
import 'login_btn.dart';

class LoginInputId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginBtnController());

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: TextFormField(
          obscureText: false,
          maxLength: 16,
          style: textThemeCommon().headline3,
          decoration: InputDecoration(
            labelStyle: textThemeCommon().headline3,
            labelText: 'text_id'.tr,
            hintText: 'hint_id_input'.tr,
            hintStyle: TextStyle(color: Color(DARK_COLOR)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(DARK_COLOR),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(DARK_COLOR),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Color(COMMON_COLOR),
            contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
            counterText: '',
          ),
          initialValue: Hive.box(LOCAL_DB).get(KEY_SAVED_ID),
          onChanged: (text) {
            Get.find<LoginBtnController>().setInputId(text);
          },
        )),
      ],
    );
  }
}
