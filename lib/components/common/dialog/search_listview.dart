import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/dialog/search_listitem.dart';
import 'package:misxV2/models/common/customer.dart';
import 'package:misxV2/utils/theme/color_manager.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../models/common/item.dart';
import '../../../models/common/lenditem.dart';
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
            color: CommonColors.white,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
              height: 50,
              color: context.theme.backgroundColor,
              padding: const EdgeInsets.all(5),
              child: selectSearchListItem(index),
            ));
          },
        ));
  }

  Widget selectSearchListItem(int index) {
    if (Get.find<SearchListController>().flag == SEARCH_DIALOG_CUST) {
      return SearchListItem(Get.find<SearchListController>().datas[index].getCustCd, Get.find<SearchListController>().datas[index].getCustNm,
          Get.find<SearchListController>().datas[index].getCustAbbNm, Get.find<SearchListController>().datas[index].getCustStatNm);
    } else if (Get.find<SearchListController>().flag == SEARCH_DIALOG_ITEM) {
      return SearchListItem(Get.find<SearchListController>().datas[index].getItmCd, Get.find<SearchListController>().datas[index].getItmNm,
          Get.find<SearchListController>().datas[index].getItmAbbNm, Get.find<SearchListController>().datas[index].getUzFgNm);
    } else {
      return SearchListItem(Get.find<SearchListController>().datas[index].getLendItmCd, Get.find<SearchListController>().datas[index].getLendItmNm,
          Get.find<SearchListController>().datas[index].getVesFgNm, Get.find<SearchListController>().datas[index].getEmptyBotlNm);
    }
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

    // if (dummy == DUMMY_CUST) {
    //   parsedResponse = dataObjsJson.map((dataJson) => CustomerModel.fromJson(dataJson)).toList();
    //   flag = SEARCH_DIALOG_CUST;
    // } else if (dummy == DUMMY_ITEM) {
    //   parsedResponse = dataObjsJson.map((dataJson) => ItemModel.fromJson(dataJson)).toList();
    //   flag = SEARCH_DIALOG_ITEM;
    // } else if (dummy == DUMMY_LEND) {
    //   parsedResponse = dataObjsJson.map((dataJson) => LendItemModel.fromJson(dataJson)).toList();
    //   flag = SEARCH_DIALOG_LEND;
    // }
    datas.clear();
    datas.addAll(parsedResponse);
  }
}
