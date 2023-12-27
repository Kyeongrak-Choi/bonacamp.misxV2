import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/login/login_btn.dart';
import 'package:misxV2/components/login/login_input_id.dart';
import 'package:misxV2/components/login/login_input_pw.dart';
import 'package:misxV2/components/login/login_logo.dart';
import 'package:misxV2/components/login/login_policy.dart';

import '../../utils/constants.dart';
import '../../utils/theme/text_theme.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: context.theme.canvasColor,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 30),
                      child: LoginLogo(), // Logo
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 1),
                      child: LoginInputId(), // ID
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                      child: LoginInputPw(), // PW
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                      child: LoginBtn(), // Login
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: PolicyView(), // 개인정보 처리방침
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    COPY_RIGHT,
                    style: textThemeCommon().bodyMedium,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
