import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

class OptionBtnVisible extends StatelessWidget {
  bool visible;

  OptionBtnVisible({required this.visible});

  @override
  Widget build(BuildContext context) {
    return visible == true
        ? ImageIcon(
            AssetImage('lib/assets/icons/Invisible.png'), color: context.theme.focusColor, size: 24,)
        : ImageIcon(
            AssetImage('lib/assets/icons/Visible.png'), color: context.theme.focusColor, size: 24,);
  }
}
