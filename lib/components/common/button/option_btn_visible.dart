import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionBtnVisible extends StatelessWidget {
  bool visible;

  OptionBtnVisible({required this.visible});

  @override
  Widget build(BuildContext context) {
    return visible == true
        ? Icon(
            Icons.arrow_circle_up_outlined,
            color: context.theme.primaryColor,
          )
        : Icon(
            Icons.arrow_circle_down,
            color: context.theme.primaryColor,
          );
  }
}
