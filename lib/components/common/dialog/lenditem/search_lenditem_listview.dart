import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/dialog/lenditem/search_lenditem_listitem.dart';
import 'package:misxV2/models/common/lenditem.dart';
import 'package:misxV2/utils/network/network_manager.dart';
import 'package:misxV2/utils/theme/color_manager.dart';
import 'package:misxV2/utils/utility.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../../../models/system/userinfo.dart';
import '../../../../utils/constants.dart';

class SearchLendItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SearchLendItemListController());
    Get.put(NetworkManager());
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: Get.find<SearchLendItemListController>().datas.length,
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
    return SearchLendItemListItem(
        Get.find<SearchLendItemListController>().datas[index].getLendItmCd ?? '',
        Get.find<SearchLendItemListController>().datas[index].getLendItmNm ?? '',
        Get.find<SearchLendItemListController>().datas[index].getVesFgNm ?? '',
        Get.find<SearchLendItemListController>().datas[index].getEmptyBotlNm ?? '');
  }
}

class SearchLendItemListController extends GetxController {
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
    pd.show(max: 100, msg: 'progress_loading'.tr, backgroundColor: CommonColors.bluesky);
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var param = user.getClientCode;
    var dataObjsJson;
    var dio;
    var parsedResponse = [];

    dio = await reqApi(param);

    try {
      String queryParam = Uri.encodeComponent('=' + searchTxt);
      final response = await dio.get(API_COMMON + API_COMMON_LENDITEM + '?q=search' + queryParam);

      if (response.statusCode == 200) {
        pd.close();
        if (dataObjsJson = jsonDecode(jsonEncode(response.data))[TAG_DATA] == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
        } else {
          dataObjsJson = jsonDecode(jsonEncode(response.data))[TAG_DATA] as List;
          parsedResponse = dataObjsJson.map((dataJson) => LendItemModel.fromJson(dataJson)).toList();
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
