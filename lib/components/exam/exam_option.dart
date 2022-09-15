import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ExamOption extends StatelessWidget {

  ExamOptionController examOptionController = Get.put(ExamOptionController());

  @override
  Widget build(context) {
    return Row(
      children: [
        ExamOption(),
      ],
    );
  }

}

class ExamOptionController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SystemChannels.textInput.invokeListMethod('TextInput.hide');
  }
}
