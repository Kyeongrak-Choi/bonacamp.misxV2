import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/search_listitem.dart';
import 'package:misxV2/models/common/customer.dart';
import 'package:misxV2/utils/utillity.dart';
import '../../../utils/constants.dart';
import '../../../models/common/product.dart';

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
              child: Get.find<SearchListController>().flag == 'C'
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
