import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/utils/constants.dart';

import '../../utils/theme/color_manager.dart';
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
          style: textThemeCommon().displayMedium,
          decoration: InputDecoration(
            labelStyle: textThemeCommon().displayMedium,
            labelText: 'text_id'.tr,
            hintText: 'hint_id_input'.tr,
            hintStyle: TextStyle(color: CommonColors.dark),
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
          initialValue: Hive.box(LOCAL_DB).get(KEY_SAVED_ID),
          onChanged: (text) {
            Get.find<LoginBtnController>().setInputId(text);
          },
        )),
      ],
    );
  }
}
