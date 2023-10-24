import 'package:flutter/material.dart';
import 'package:misxV2/components/login/login_btn.dart';
import 'package:misxV2/components/login/login_input_id.dart';
import 'package:misxV2/components/login/login_input_pw.dart';
import 'package:misxV2/components/login/login_logo.dart';
import 'package:misxV2/components/login/login_policy.dart';

import '../../utils/constants.dart';
import '../../utils/theme/color_manager.dart';
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
          color: LightColors.background,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: CommonColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.zero,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.all(20),
                          child: LoginLogo(), // Logo
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                          child: LoginInputId(), // ID
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                          child: LoginInputPw(), // PW
                        ),
                        Divider(
                          height: 2,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                          color: CommonColors.dark,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.all(20),
                          child: LoginBtn(), // Login
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.all(20),
                          child: PolicyView(), // 개인정보 처리방침
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.all(20),
                          child: Text(
                            COPY_RIGHT,
                            style: textThemeCommon().bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
