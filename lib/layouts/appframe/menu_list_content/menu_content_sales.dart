import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/menu/card_title_menu.dart';
import '../../../utils/menu_manager.dart';

class MenuContentSales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.all(15),
            child: CardTitleMenuList(menuTitleName: 'menu_main_sales'.tr, iconMenuList: salesAnalysisMaster),
          )
    );
  }
}