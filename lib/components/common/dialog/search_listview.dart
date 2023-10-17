import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/dialog/search_listitem.dart';
import 'package:misxV2/models/common/customer.dart';
import 'package:misxV2/models/common/item.dart';
import 'package:misxV2/models/common/lenditem.dart';
import 'package:misxV2/utils/network/network_manager.dart';
import 'package:misxV2/utils/theme/color_manager.dart';
import 'package:misxV2/utils/utility.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';

class SearchList extends StatelessWidget {
  var flag;

  SearchList(String flag) {
    this.flag = flag;
  }

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
              color: context.theme.cardColor,
              padding: const EdgeInsets.all(5),
              child: selectSearchListItem(index),
            ));
          },
        ));
  }

  Widget selectSearchListItem(int index) {
    switch (flag) {
      case SEARCH_DIALOG_CUST:
        return SearchListItem(
            Get.find<SearchListController>().datas[index].getCode ?? '',
            Get.find<SearchListController>().datas[index].getName ?? '',
            Get.find<SearchListController>().datas[index].getBusinessItem ?? '',
            Get.find<SearchListController>().datas[index].getStatuaName ?? '');
      case SEARCH_DIALOG_PRCH:
        return SearchListItem(
            Get.find<SearchListController>().datas[index].getCode ?? '',
            Get.find<SearchListController>().datas[index].getName ?? '',
            Get.find<SearchListController>().datas[index].getBusinessItem ?? '',
            Get.find<SearchListController>().datas[index].getStatuaName ?? '');
      case SEARCH_DIALOG_ITEM:
        return SearchListItem(
            Get.find<SearchListController>().datas[index].getItmCd ?? '',
            Get.find<SearchListController>().datas[index].getItmNm ?? '',
            Get.find<SearchListController>().datas[index].getItmAbbNm ?? '',
            Get.find<SearchListController>().datas[index].getUzFgNm ?? '');
      case SEARCH_DIALOG_LEND:
        return SearchListItem(
            Get.find<SearchListController>().datas[index].getLendItmCd ?? '',
            Get.find<SearchListController>().datas[index].getLendItmNm ?? '',
            Get.find<SearchListController>().datas[index].getVesFgNm ?? '',
            Get.find<SearchListController>().datas[index].getEmptyBotlNm ?? '');
      default:
        return SearchListItem('', '', '', '');
    }
  }
}

class SearchListController extends GetxController {
  RxList datas = [].obs;
  var searchFlag;
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

  void setFlag(flag) {
    searchFlag = flag;
  }

  void search(String flag) async {
    ProgressDialog pd = ProgressDialog(context: Get.context);
    pd.show(max: 100, msg: 'progress_loading'.tr, backgroundColor: CommonColors.bluesky);
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var param = user.getClientCode;
    var dataObjsJson;
    var dio;
    var parsedResponse = [];

    dio = await reqApi(param);
    switch (flag) {
      case SEARCH_DIALOG_CUST:
        // 거래처(매출처) 검색
        try {
          String queryParam =
              Uri.encodeComponent('=' + searchTxt + '&type=2' + '&like=' + Hive.box(LOCAL_DB).get(KEY_COMPARE_FIRST, defaultValue: true).toString());
          final response = await dio.get(API_COMMON + API_COMMON_CUSTOMER + '?q=search' + queryParam);

          if (response.statusCode == 200) {
            pd.close();
            if(dataObjsJson = jsonDecode(jsonEncode(response.data))[TAG_DATA]  == null ){
              ShowSnackBar(SNACK_TYPE.INFO,jsonDecode(jsonEncode(response.data))[TAG_MSG]);
            }else {
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
        break;
      case SEARCH_DIALOG_PRCH:
        //  매입처 검색
        try {
          String queryParam =
              Uri.encodeComponent('=' + searchTxt + '&type=1' + '&like=' + Hive.box(LOCAL_DB).get(KEY_COMPARE_FIRST, defaultValue: true).toString());
          final response = await dio.get(API_COMMON + API_COMMON_CUSTOMER + '?q=search' + queryParam);

          if (response.statusCode == 200) {
            pd.close();
            if(dataObjsJson = jsonDecode(jsonEncode(response.data))[TAG_DATA]  == null ){
              ShowSnackBar(SNACK_TYPE.INFO,jsonDecode(jsonEncode(response.data))[TAG_MSG]);
            }else {
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
        break;
      case SEARCH_DIALOG_ITEM:
        // 품목 검색
        try {
          String queryParam = Uri.encodeComponent('=' + searchTxt);
          final response = await dio.get(API_COMMON + API_COMMON_ITEM + '?q=search' + queryParam);

          if (response.statusCode == 200) {
            pd.close();
            if(dataObjsJson = jsonDecode(jsonEncode(response.data))[TAG_DATA]  == null ){
              ShowSnackBar(SNACK_TYPE.INFO,jsonDecode(jsonEncode(response.data))[TAG_MSG]);
            }else {
              dataObjsJson = jsonDecode(jsonEncode(response.data))[TAG_DATA] as List;
              parsedResponse = dataObjsJson.map((dataJson) => ItemModel.fromJson(dataJson)).toList();
            }
          }
          pd.close();
        } on DioException catch (e) {
          pd.close();
          if (e.response != null) {
            ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
          }
        }
        break;
      case SEARCH_DIALOG_LEND:
        // 용기공병 검색
        try {
          String queryParam = Uri.encodeComponent('=' + searchTxt);
          final response = await dio.get(API_COMMON + API_COMMON_LENDITEM + '?q=search' + queryParam);

          if (response.statusCode == 200) {
            pd.close();
            if(dataObjsJson = jsonDecode(jsonEncode(response.data))[TAG_DATA]  == null ){
              ShowSnackBar(SNACK_TYPE.INFO,jsonDecode(jsonEncode(response.data))[TAG_MSG]);
            }else {
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
        break;
    }

    datas.clear();
    datas.addAll(parsedResponse);
  }
}
