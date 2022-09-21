import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import '../../utils/constants.dart';
import '../../utils/network/request_controller.dart';

// 예제 화면
class ApiExample extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(RequestController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Test Exam'),
        backgroundColor: context.theme.backgroundColor,
        iconTheme: context.theme.iconTheme,
        actions: [
          IconButton(
            icon: OptionBtnVisible(),
            onPressed: () => null,
          ),
        ],
      ),
      body: Container(
          color: context.theme.backgroundColor,
          child: Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.canvasColor,
                  ),
                  onPressed: () =>
                      Get.find<RequestController>().RequestApi(HealthCheck, ''),
                  child: Text(
                    'api call'.tr,
                    style: context.textTheme.bodyText1,
                  )),
              Obx(
                () => Text(
                  Get.find<RequestController>().responseData.value,
                ),
              )
            ],
          )),
    );
  }
}
