import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            color: context.theme.canvasColor,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.all(15),
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
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: CommonColors.primary,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: LoginBtn(), // Login
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.all(15),
                        child: PolicyView(), // 개인정보 처리방침
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: Align(
      //   alignment: Alignment.bottomCenter,
      //   child: Text(
      //     COPY_RIGHT,
      //     style: textThemeCommon().bodyLarge,
      //     textAlign: TextAlign.right,
      //   ),
      // ),
    );
  }
}
