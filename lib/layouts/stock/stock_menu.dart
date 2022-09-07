import 'package:flutter/cupertino.dart';
import '../../components/menu/card_icon_menu.dart';
import '../../components/menu/menu_manager.dart';

class StockMenu extends StatelessWidget {
  const StockMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CardIconMenu(iconMenuList: stockMenu),
      ],
    );
  }
}
