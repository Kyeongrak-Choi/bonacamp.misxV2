import 'package:flutter/material.dart';
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
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '[' + menuTitleName + '] ',
            style: context.textTheme.headline1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Card(
          elevation: 0.5,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          color: context.theme.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
        //color: Color(AppColor),
        color: context.theme.backgroundColor,
        child: Row(
          children: [
            Icon(
              iconData,
              size: 17,
              color: context.theme.primaryColor,
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: context.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
