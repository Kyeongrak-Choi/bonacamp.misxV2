import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // Expanded(
        //     child: Image.asset(
        //   'lib/assets/icons/logo.png',
        // )),
        Text(
          'DIONYSOS',
          //style: context.textTheme.headlineLarge,
          style: TextStyle(
            fontSize: 40.sp,
            color: CommonColors.primary,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          '디오니소스 경영관리 서비스',
          //style: context.textTheme.titleSmall,
          style: TextStyle(fontSize: 16.sp, color: CommonColors.sublogo),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
