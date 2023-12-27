import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/menu/card_title_menu.dart';
import '../../../utils/menu_manager.dart';

class MenuContentManagemet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(0),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.all(0),
          child: CardTitleMenuList(menuTitleName: 'menu_main_managemnent'.tr, iconMenuList: managementAnalysisMaster),
        ));
  }
}
