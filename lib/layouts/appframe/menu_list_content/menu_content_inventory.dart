import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/menu/card_title_menu.dart';
import '../../../utils/menu_manager.dart';

class MenuContentInventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: context.theme.hoverColor,
          borderRadius: BorderRadius.circular(0),
          shape: BoxShape.rectangle,
        ),
        child: Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
                child: CardTitleMenuList(
                    menuTitleName: 'menu_main_asset'.tr,
                    iconMenuList: inventoryAnalysisMaster))));
  }
}
