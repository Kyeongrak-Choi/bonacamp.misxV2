import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/utils/theme/theme_manager.dart';

import '../../utils/theme/text_theme.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            'App_name'.tr,
            style: textThemeLogin().headline1,
          ),
        ),
      ],
    );
  }
}
