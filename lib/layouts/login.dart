import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renew_misx/components/login/login_btn.dart';
import 'package:renew_misx/components/login/login_input_id.dart';
import 'package:renew_misx/components/login/login_input_pw.dart';
import 'package:renew_misx/components/login/login_logo.dart';
import '../constants.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(AppColor),
        ),
        child: Center(
          //alignment: AlignmentDirectional(0, 1),
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 36, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: LoginLogo(), // Logo
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: LoginInputId(), // ID
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 20),
                          child: LoginInputPw(), // PW
                        ),
                        Divider(
                          height: 2,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                          color: Color(0xFFDBE2E7),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: LoginBtn(), // PW
                        ), // Btn
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
