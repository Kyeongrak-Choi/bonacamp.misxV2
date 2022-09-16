import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/utils/constants.dart';
import '../../utils/theme/text_theme.dart';
import '../../utils/theme/theme_manager.dart';
import 'menu_manager.dart';

class CardIconMenu extends StatelessWidget {
  final List<IconMenu> iconMenuList;

  CardIconMenu({required this.iconMenuList});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      color: context.theme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(
              iconMenuList.length,
              (index) => buildRowIconItem(
                  iconMenuList[index].title, iconMenuList[index].iconData,context)),
        ),
      ),
    );
  }

  Widget buildRowIconItem(String title, IconData iconData, BuildContext context) {
    return Container(
      height: 50,
      //color: Color(AppColor),
      color: context.theme.backgroundColor,
      child: Row(
        children: [
          Icon(
            iconData,
            size: 17,
            color: context.theme.primaryColor ,
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: context.textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
