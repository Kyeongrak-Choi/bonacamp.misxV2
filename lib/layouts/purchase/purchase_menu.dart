import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../components/menu/card_icon_menu.dart';
import '../../components/menu/menu_manager.dart';

class PurchaseMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.backgroundColor,
      child: ListView(
        children: <Widget>[
          CardIconMenu(iconMenuList: purchaseMenu),
        ],
      ),
    );
  }
}
