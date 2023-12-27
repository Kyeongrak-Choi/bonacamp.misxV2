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
        // Container(
        //   alignment: Alignment.centerLeft,
        //   child: Text(
        //     menuTitleName,
        //     style: context.textTheme.displayLarge,
        //     overflow: TextOverflow.ellipsis,
        //   ),
        // ),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          color: context.theme.cardColor,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 10, 0),
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
        height: 50,
        color: context.theme.cardColor,
        child: Row(
          children: [
            // Icon(
            //   iconData,
            //   size: 20,
            //   color: context.theme.primaryColor,
            // ),
            // SizedBox(width: 20),
            Text(
              title,
              //style: context.textTheme.displayMedium,
              style: TextStyle(fontSize:  16.sp, color: Colors.black),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size:  16,
              color: context.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
