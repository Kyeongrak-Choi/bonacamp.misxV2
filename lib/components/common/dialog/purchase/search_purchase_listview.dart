import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/dialog/purchase/search_purchase_listitem.dart';
import 'package:misxV2/models/common/customer.dart';
import 'package:misxV2/utils/network/network_manager.dart';
import 'package:misxV2/utils/theme/color_manager.dart';
import 'package:misxV2/utils/utility.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../../../models/system/userinfo.dart';
import '../../../../utils/constants.dart';

class SearchPurchaseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SearchPurchaseListController());
    Get.put(NetworkManager());
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: Get.find<SearchPurchaseListController>().datas.length,
          // Divider 로 구분자 추가.
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 5,
            color: CommonColors.white,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
              height: 50,
              color: context.theme.cardColor,
              padding: const EdgeInsets.all(5),
              child: selectSearchListItem(index),
            ));
          },
        ));
  }

  Widget selectSearchListItem(int index) {
    return SearchPurchaseListItem(
        Get.find<SearchPurchaseListController>().datas[index].getCode ?? '',
        Get.find<SearchPurchaseListController>().datas[index].getName ?? '',
        Get.find<SearchPurchaseListController>().datas[index].getBusinessItem ?? '',
        Get.find<SearchPurchaseListController>().datas[index].getStatuaName ?? '');
  }
}

class SearchPurchaseListController extends GetxController {
  RxList datas = [].obs;
  var searchTxt = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSearchTxt(text) {
    searchTxt = text;
  }

  void search() async {
    ProgressDialog pd = ProgressDialog(context: Get.context);
    pd.show(
      max: 1000,
      msg: 'Searching',
      cancel: Cancel(),
      backgroundColor: CommonColors.white,
      progressValueColor: CommonColors.signature,
      msgColor: CommonColors.signature,
    );
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var param = user.getClientCode;
    var dataObjsJson;
    var dio;
    var parsedResponse = [];

    dio = await reqApi(param);

    try {
      String queryParam =
          Uri.encodeComponent('=' + searchTxt + '&type=1' + '&like=' + Hive.box(LOCAL_DB).get(KEY_COMPARE_FIRST, defaultValue: true).toString());
      final response = await dio.get(API_COMMON + API_COMMON_CUSTOMER + '?q=search' + queryParam);

      if (response.statusCode == 200) {
        pd.close();
        if (dataObjsJson = jsonDecode(jsonEncode(response.data))[TAG_DATA] == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
        } else {
          dataObjsJson = jsonDecode(jsonEncode(response.data))[TAG_DATA] as List;
          parsedResponse = dataObjsJson.map((dataJson) => CustomerModel.fromJson(dataJson)).toList();
        }
      }
      pd.close();
    } on DioException catch (e) {
      pd.close();
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    }

    datas.clear();
    datas.addAll(parsedResponse);
  }
}
