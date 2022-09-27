import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/search_listitem.dart';
import 'package:misxV2/models/common/customer.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/common/product.dart';
import '../../../utils/constants.dart';

class SearchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SearchListController());
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: Get.find<SearchListController>().datas.length,
          // Divider 로 구분자 추가.
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 5,
            color: Colors.white,
          ),

          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
              height: 50,
              color: context.theme.backgroundColor,
              padding: const EdgeInsets.all(5),
              child: Get.find<SearchListController>().flag == SEARCH_DIALOG_CUST
                  ? SearchListItem(
                      Get.find<SearchListController>()
                          .parsedResponse[index]
                          .custCd
                          .toString(),
                      Get.find<SearchListController>()
                          .parsedResponse[index]
                          .custNm
                          .toString(),
                      Get.find<SearchListController>()
                          .parsedResponse[index]
                          .custAbbNm
                          .toString(),
                      Get.find<SearchListController>()
                          .parsedResponse[index]
                          .custStatNm
                          .toString())
                  : SearchListItem(
                      Get.find<SearchListController>()
                          .parsedResponse[index]
                          .itmCd
                          .toString(),
                      Get.find<SearchListController>()
                          .parsedResponse[index]
                          .itmNm
                          .toString(),
                      Get.find<SearchListController>()
                          .parsedResponse[index]
                          .itmAbbNm
                          .toString(),
                      Get.find<SearchListController>()
                          .parsedResponse[index]
                          .ufFgNm
                          .toString()),
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
    var dataObjsJson = jsonDecode(jsonString)[TAG_DATA] as List;

    if (dummy == DUMMY_CUST) {
      parsedResponse = dataObjsJson
          .map((dataJson) => CustomerModel.fromJson(dataJson))
          .toList();
      flag = SEARCH_DIALOG_CUST;
    } else if (dummy == DUMMY_PROD) {
      parsedResponse = dataObjsJson
          .map((dataJson) => ProductModel.fromJson(dataJson))
          .toList();
      flag = SEARCH_DIALOG_PROD;
    }
    datas.clear();
    datas.addAll(parsedResponse);
  }
}
