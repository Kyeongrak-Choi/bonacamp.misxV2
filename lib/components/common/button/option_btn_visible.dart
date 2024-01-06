import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OptionBtnVisible extends StatelessWidget {
  bool visible;

  OptionBtnVisible({required this.visible});

  @override
  Widget build(BuildContext context) {
    return visible == true
        ? ImageIcon(
            AssetImage('lib/assets/icons/Invisible.png'),
            color: context.theme.primaryColor,
            size: 24,
          )
        : ImageIcon(
            AssetImage('lib/assets/icons/Visible.png'),
            color: context.theme.primaryColor,
            size: 24,
          );
  }
}
