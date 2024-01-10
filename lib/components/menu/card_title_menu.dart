import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/utils/constants.dart';

import '../../utils/menu_manager.dart';

class CardTitleMenuList extends StatelessWidget {
  final String menuTitleName;
  final List<IconMenu> iconMenuList;

  CardTitleMenuList({required this.iconMenuList, required this.menuTitleName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0.h,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                BASIC_PADDING * 2.w, 0.h, BASIC_PADDING * 2.w, 0.h),
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
        )
      ],
    );
  }

  Widget buildRowIconItem(
      String title, IconData iconData, String path, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(path),
      child: Container(
        height: BASIC_PADDING * 7.h,
        child: Row(
          children: [
            Text(title, style: context.textTheme.bodyLarge),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 14.sp,
              color: context.theme.colorScheme.onBackground, // font20
            ),
          ],
        ),
      ),
    );
  }
}
