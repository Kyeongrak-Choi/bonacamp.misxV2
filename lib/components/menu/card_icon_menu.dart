import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renew_misx/constants.dart';
import '../../../theme.dart';
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
      color: Color(AppColor),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(
              iconMenuList.length,
              (index) => _buildRowIconItem(
                  iconMenuList[index].title, iconMenuList[index].iconData)),
        ),
      ),
    );
  }

  Widget _buildRowIconItem(String title, IconData iconData) {
    return Container(
      height: 50,
      color: Color(AppColor),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 17,
            color: Colors.white,
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: textTheme().subtitle1,
          )
        ],
      ),
    );
  }
}
