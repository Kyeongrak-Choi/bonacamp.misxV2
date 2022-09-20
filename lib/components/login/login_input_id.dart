import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';
import '../../utils/theme/text_theme.dart';
import 'login_btn.dart';

class LoginInputId extends StatelessWidget {
  const LoginInputId({Key? key}) : super(key: key);

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
          style: textThemeLogin().headline3,
          decoration: InputDecoration(
            labelStyle: textThemeLogin().headline3,
            labelText: 'text_id'.tr,
            hintText: 'hint_id_input'.tr,
            hintStyle: TextStyle(color: Color(AppColor)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(AppColor),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(AppColor),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
            counterText: '',
          ),
          onChanged: (text) {
            Get.find<LoginBtnController>().inputId = text;
          },
        )),
      ],
    );
  }
}
