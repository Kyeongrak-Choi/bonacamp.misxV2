import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'dialog/option_dialog.dart';

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(OptionDialogController());
    return GestureDetector(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(''),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
