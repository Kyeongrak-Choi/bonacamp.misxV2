import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renew_misx/components/common/dialog_search/search_listitem.dart';
import 'package:renew_misx/models/common/customer.dart';
import 'package:renew_misx/utils/utillity.dart';

import '../../../constants.dart';
import '../../../models/common/product.dart';

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
            height: 5,
            color: Colors.white,
          ),

          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
              height: 50,
              color: Color(AppColor),
              padding: const EdgeInsets.all(5),
              child: listController.flag == 'C'
                  ? SearchListItem(
                      listController.parsedResponse[index].custCd.toString(),
                      listController.parsedResponse[index].custNm.toString(),
                      listController.parsedResponse[index].custAbbNm.toString(),
                      listController.parsedResponse[index].custStatNm.toString())
                  : SearchListItem(
                      listController.parsedResponse[index].itmCd.toString(),
                      listController.parsedResponse[index].itmNm.toString(),
                      listController.parsedResponse[index].itmAbbNm.toString(),
                      listController.parsedResponse[index].ufFgNm.toString()),
            ));
          },
        ));
  }
}

class SearchListController extends GetxController {
  RxList datas = [].obs;
  var parsedResponse = [];
  var flag;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void search(String dummy) async {
    var jsonString = await jsonDummy(dummy);
    var dataObjsJson = jsonDecode(jsonString)['data'] as List;

    if (dummy == dummy_customer) {
      parsedResponse = dataObjsJson
          .map((dataJson) => CustomerList.fromJson(dataJson))
          .toList();
      flag = 'C';
    } else if (dummy == dummy_product) {
      parsedResponse = dataObjsJson
          .map((dataJson) => ProductList.fromJson(dataJson))
          .toList();
      flag = 'P';
    }
    datas.clear();
    datas.addAll(parsedResponse);
    update();
  }
}
