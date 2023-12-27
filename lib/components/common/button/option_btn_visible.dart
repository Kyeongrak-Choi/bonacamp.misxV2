import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OptionBtnVisible extends StatelessWidget {
  bool visible;

  OptionBtnVisible({required this.visible});

  @override
  Widget build(BuildContext context) {
    return visible == true
        ? Icon(
            CupertinoIcons.rectangle_compress_vertical,
            color: context.theme.primaryColorDark,
          )
        : Icon(
            CupertinoIcons.rectangle_expand_vertical,
            color: context.theme.primaryColorDark,
          );
  }
}
