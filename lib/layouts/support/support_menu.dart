import 'package:flutter/cupertino.dart';
import '../../components/menu/card_icon_menu.dart';
import '../../components/menu/menu_manager.dart';

class SupportMenu extends StatelessWidget {
  const SupportMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CardIconMenu(iconMenuList: supportMenu),
      ],
    );
  }
}
