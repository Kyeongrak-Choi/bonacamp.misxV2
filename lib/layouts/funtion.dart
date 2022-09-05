import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../components/common/dialog_search/search_dialog.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => Get.to(SearchDialog('C')),
                child: Text('title_search_customer'.tr)),
            ElevatedButton(onPressed: () => Get.to(SearchDialog('P')),
                child: Text('title_search_product'.tr)),
          ],
        ),
      ),
    );
  }
}
