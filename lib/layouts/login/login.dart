import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/login/login_btn.dart';
import 'package:misxV2/components/login/login_input_id.dart';
import 'package:misxV2/components/login/login_logo.dart';
import 'package:misxV2/components/login/login_policy.dart';

import '../../utils/constants.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          BASIC_PADDING * 2.w,
                          BASIC_PADDING * 15.h,
                          BASIC_PADDING * 2.w,
                          BASIC_PADDING * 4.h),
                      child: LoginLogo(), // Logo
                    ),
                    Padding(
                      padding: EdgeInsets.all(BASIC_PADDING * 2),
                      child: LoginInputId(), // ID
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2,
                          0, BASIC_PADDING * 2, BASIC_PADDING * 2),
                      child: LoginBtn(), // Login
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, BASIC_PADDING * 3, 0, 0),
                      child: PolicyView(), // 개인정보 처리방침
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(BASIC_PADDING * 2),
                  child: Text(
                    COPY_RIGHT,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.onSurfaceVariant),
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
