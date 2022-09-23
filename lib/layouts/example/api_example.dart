import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import '../../utils/constants.dart';
import '../../utils/network/request_controller.dart';
import '../../utils/utillity.dart';

// 예제 화면
class ApiExample extends StatelessWidget {
  final systemBox = Hive.box('SYSTEM');

  @override
  Widget build(context) {
    Get.put(RequestController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Test Exam'),
        backgroundColor: context.theme.backgroundColor,
        iconTheme: context.theme.iconTheme,
      ),
      body: Obx(() => Column(
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
              Text(
                Get.find<RequestController>().responseData.value,
              ),
            ],
          )),
    );
  }
}
