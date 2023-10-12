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
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
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
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: LoginLogo(), // Logo
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: LoginInputId(), // ID
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
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
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: LoginBtn(), // Login
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                          child: PolicyView(), // 개인정보 처리방침
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
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
