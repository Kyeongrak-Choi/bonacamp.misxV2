import 'package:flutter/cupertino.dart';
import 'package:renew_misx/components/common/menu/card_icon_menu.dart';

import '../../components/common/menu/menu_manager.dart';

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
