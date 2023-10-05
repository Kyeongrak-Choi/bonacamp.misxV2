import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/menu_manager.dart';

class CardIconMenu extends StatelessWidget {
  final List<IconMenu> iconMenuList;

  CardIconMenu({required this.iconMenuList});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: context.theme.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: List.generate(iconMenuList.length,
              (index) => buildRowIconItem(iconMenuList[index].title, iconMenuList[index].iconData, iconMenuList[index].path, context)),
        ),
      ),
    );
  }

  Widget buildRowIconItem(String title, IconData iconData, String path, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(path),
      child: Container(
        height: 50,
        //color: Color(AppColor),
        color: context.theme.cardColor,
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
              style: context.textTheme.titleMedium,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: context.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
