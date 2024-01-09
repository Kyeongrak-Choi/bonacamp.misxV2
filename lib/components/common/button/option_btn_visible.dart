import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionBtnVisible extends StatelessWidget {
  bool visible;

  OptionBtnVisible({required this.visible});

  @override
  Widget build(BuildContext context) {
    return visible == true
        ? ImageIcon(
            AssetImage('lib/assets/icons/Invisible.png'),
            size: 24.sp,
          )
        : ImageIcon(
            AssetImage('lib/assets/icons/Visible.png'),
            size: 24.sp,
          );
  }
}
