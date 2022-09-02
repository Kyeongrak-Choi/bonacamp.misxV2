import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:renew_misx/models/common/customer.dart';
import 'package:renew_misx/utils/getDummy.dart';
import 'dart:developer';

import '../../../constants.dart';

class SearchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchListController listController = Get.put(SearchListController());

    return Obx(() => ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: listController.datas.length,
          // Divider 로 구분자 추가.
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 10,
            color: Colors.blue,
          ),
          itemBuilder: (BuildContext context, int index) {
            var item = listController.datas[index].toString();
            return Container(
              height: 30,
              color: Colors.white,
              padding: const EdgeInsets.all(5),
              //child: Center(child: Text('test')),
              child: Center(child: Text(item)),
            );
          },
        ));
  }
}

class SearchListController extends GetxController {
  RxList datas = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void search() async {
    var jsonString = await getDummy(dummy_customer);
    var dataObjsJson = jsonDecode(jsonString)['data'] as List;
    List<CustomerList> parsedResponse = dataObjsJson
        .map((dataJson) => CustomerList.fromJson(dataJson))
        .toList();
    datas.clear();
    datas.addAll(parsedResponse);
    update();
  }
}
