import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../utils/constants.dart';
import '../../utils/network/network_manager.dart';

// 예제 화면
class ApiExample extends StatelessWidget {
  final systemBox = Hive.box(LOCAL_DB);

  @override
  Widget build(context) {
    Get.put(NetworkManager());
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
                  onPressed: () => Get.find<NetworkManager>()
                      .RequestApi(API_URL_DEV, '', context),
                  child: Text(
                    'health check'.tr,
                    style: context.textTheme.bodyText1,
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.canvasColor,
                  ),
                  onPressed: () => Get.find<NetworkManager>()
                      .getToken(CERT_TOKEN),
                  child: Text(
                    'get token call'.tr,
                    style: context.textTheme.bodyText1,
                  )),
              Text(
                Get.find<NetworkManager>().responseData.value,
              ),
            ],
          )),
    );
  }
}
