import 'package:flutter/cupertino.dart';
import 'package:renew_misx/components/common/menu/menu_manager.dart';

import '../../components/common/menu/card_icon_menu.dart';

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
