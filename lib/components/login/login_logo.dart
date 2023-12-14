import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        // Expanded(
        //     child: Image.asset(
        //   'lib/assets/icons/logo.png',
        // )),
        Expanded(
          child: Text(
            'DIONYSOS\n\n경영관리',
            style: TextStyle(
              fontSize: 30, // 폰트 크기
              fontFamily: 'Black Han Sans', // 사용할 폰트 패밀리
              fontWeight: FontWeight.bold, // 폰트 굵기
              color: CommonColors.signature, // 텍스트 색상
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
