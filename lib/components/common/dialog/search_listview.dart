import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/dialog/search_listitem.dart';
import 'package:misxV2/models/common/customer.dart';
import 'package:misxV2/utils/network/network_manager.dart';
import 'package:misxV2/utils/theme/color_manager.dart';

import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';

class SearchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SearchListController());
    Get.put(NetworkManager());
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
    // if (Get.find<SearchListController>().flag == SEARCH_DIALOG_CUST) {
    //   return SearchListItem(Get.find<SearchListController>().datas[index].getCustCd, Get.find<SearchListController>().datas[index].getCustNm,
    //       Get.find<SearchListController>().datas[index].getCustAbbNm, Get.find<SearchListController>().datas[index].getCustStatNm);
    // } else if (Get.find<SearchListController>().flag == SEARCH_DIALOG_PRCH) {
    //   return SearchListItem(Get.find<SearchListController>().datas[index].getCustCd, Get.find<SearchListController>().datas[index].getCustNm,
    //       Get.find<SearchListController>().datas[index].getCustAbbNm, Get.find<SearchListController>().datas[index].getCustStatNm);
    // }
    // else if (Get.find<SearchListController>().flag == SEARCH_DIALOG_ITEM) {
    //   return SearchListItem(Get.find<SearchListController>().datas[index].getItmCd, Get.find<SearchListController>().datas[index].getItmNm,
    //       Get.find<SearchListController>().datas[index].getItmAbbNm, Get.find<SearchListController>().datas[index].getUzFgNm);
    // } else {
    //   return SearchListItem(Get.find<SearchListController>().datas[index].getLendItmCd, Get.find<SearchListController>().datas[index].getLendItmNm,
    //       Get.find<SearchListController>().datas[index].getVesFgNm, Get.find<SearchListController>().datas[index].getEmptyBotlNm);
    // }
    return SearchListItem(Get.find<SearchListController>().datas[index].getCustCd, Get.find<SearchListController>().datas[index].getCustNm,
        Get.find<SearchListController>().datas[index].getCustAbbNm, Get.find<SearchListController>().datas[index].getCustStatNm);
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

  void search(String flag) async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var param = user.getClientCode;
    var response;
    var dataObjsJson;

    switch (flag) {
      case SEARCH_DIALOG_CUST:
        // 거래처(매출처) 검색
        response = await reqApi(API_COMMON + API_COMMON_CUSTOMER + '?q=custCode%3D%26custName%3D%26is%3D', param, API_REQ_GET);
        log(response.toString());
        dataObjsJson = jsonDecode(response)[TAG_DATA][TAG_COMMON_CUSTOMER] as List;
        parsedResponse = dataObjsJson.map((dataJson) => CustomerModel.fromJson(dataJson)).toList();
        break;
      case SEARCH_DIALOG_PRCH:
        //  매입처 검색

        break;
      case SEARCH_DIALOG_ITEM:
        // 품목 검색
        break;
      case SEARCH_DIALOG_LEND:
        // 용기공병 검색
        break;
    }

    datas.clear();
    datas.addAll(parsedResponse);
  }
}
