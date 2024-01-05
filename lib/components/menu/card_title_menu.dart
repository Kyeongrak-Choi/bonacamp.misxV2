import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          color: context.theme.hoverColor,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              children: List.generate(iconMenuList.length,
                  (index) => buildRowIconItem(iconMenuList[index].title, iconMenuList[index].iconData, iconMenuList[index].path, context)),
            ),
          ),
        )
      ],
    );
  }

  Widget buildRowIconItem(String title, IconData iconData, String path, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(path),
      child: Container(
        height: 56,
        child: Row(
          children: [
            Text(
              title,
              //style: context.textTheme.displayMedium,
              style: TextStyle(fontSize: 14.sp, color: context.theme.focusColor),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 14.sp,
              color: context.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
