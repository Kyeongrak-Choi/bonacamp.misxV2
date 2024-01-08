import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/dialog/customer/search_customer_listitem.dart';
import 'package:misxV2/models/common/customer.dart';
import 'package:misxV2/utils/network/network_manager.dart';
import 'package:misxV2/utils/theme/color_manager.dart';
import 'package:misxV2/utils/utility.dart';

import '../../../../models/system/userinfo.dart';
import '../../../../utils/constants.dart';

class SearchCustomerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SearchCustomerListController());
    Get.put(NetworkManager());
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          itemCount: Get.find<SearchCustomerListController>().datas.length,
          // Divider 로 구분자 추가.
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 0,
            color: CommonColors.gray
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
              color: context.theme.canvasColor,
              padding: EdgeInsetsDirectional.fromSTEB(
                  BASIC_PADDING * 2.w,
                  BASIC_PADDING * 2.h,
                  BASIC_PADDING * 2.w,
                  BASIC_PADDING.h),
              child: selectSearchListItem(index),
            ));
          },
        ));
  }

  Widget selectSearchListItem(int index) {
    return SearchCustomerListItem(
        Get.find<SearchCustomerListController>().datas[index].getCode ?? '',
        Get.find<SearchCustomerListController>().datas[index].getName ?? '',
        Get.find<SearchCustomerListController>().datas[index].getBusinessItem ??
            '',
        Get.find<SearchCustomerListController>().datas[index].getStatuaName ??
            '');
  }
}

class SearchCustomerListController extends GetxController {
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

  void search(context) async {
    ShowProgress(context);
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var param = user.getClientCode;
    var dataObjsJson;
    var dio;
    var parsedResponse = [];

    dio = await reqApi(param);

    try {
      String queryParam = Uri.encodeComponent('=' +
          searchTxt +
          '&type=2' +
          '&like=' +
          Hive.box(LOCAL_DB)
              .get(KEY_COMPARE_FIRST, defaultValue: true)
              .toString());
      final response = await dio
          .get(API_COMMON + API_COMMON_CUSTOMER + '?q=search' + queryParam);

      if (response.statusCode == 200) {
        Navigator.pop(context);
        if (dataObjsJson =
            jsonDecode(jsonEncode(response.data))[TAG_DATA] == null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
        } else {
          dataObjsJson =
              jsonDecode(jsonEncode(response.data))[TAG_DATA] as List;
          parsedResponse = dataObjsJson
              .map((dataJson) => CustomerModel.fromJson(dataJson))
              .toList();
        }
      }
    } on DioException catch (e) {
      Navigator.pop(context);
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO,
            e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    }
    datas.clear();
    datas.addAll(parsedResponse);
  }
}
