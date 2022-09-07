import 'package:flutter/cupertino.dart';
import '../../components/menu/card_icon_menu.dart';
import '../../components/menu/menu_manager.dart';

class SalesMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CardIconMenu(iconMenuList: salesMenu),
      ],
    );
  }
}
