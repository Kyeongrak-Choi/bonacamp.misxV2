import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'DIONYSOS',
          style: context.textTheme.headlineLarge
              ?.copyWith(color: CommonColors.primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: BASIC_PADDING * 3.h,
        ),
        Text(
          '디오니소스 경영관리 서비스',
          //style: context.textTheme.titleSmall,
          style: context.textTheme.titleSmall?.copyWith(
            color: context.theme.colorScheme.onSurfaceVariant,
          ), // font40
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
