import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: Image.asset(
          'lib/assets/icons/logo.png',
        )),
      ],
    );
  }
}
