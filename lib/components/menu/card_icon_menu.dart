import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

import '../../utils/menu_manager.dart';

class CardIconMenu extends StatelessWidget {
  final List<IconMenu> iconMenuList;

  CardIconMenu({required this.iconMenuList});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: context.theme.canvasColor,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            0.w, BASIC_PADDING.h, 0.w, BASIC_PADDING.h),
        child: Column(
          children: List.generate(
              iconMenuList.length,
              (index) => buildRowIconItem(
                  iconMenuList[index].title,
                  iconMenuList[index].iconData,
                  iconMenuList[index].path,
                  context)),
        ),
      ),
    );
  }

  Widget buildRowIconItem(
      String title, IconData iconData, String path, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(path),
      child: Container(
        height: BASIC_PADDING * 3.h,
        child: Row(
          children: [
            Text(
              title,
              style: context.textTheme.bodyLarge,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
