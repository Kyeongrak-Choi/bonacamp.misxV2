import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/dialog/item/option_dialog_item.dart';

import '../../../components/common/button/option_btn_search.dart';
import '../../../components/datatable/sales/item_status_table.dart';
import '../../../models/menu/sales/item_status/item_status_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class ItemStatus extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(ItemStatusController());
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text('menu_sub_item_status'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: Get.find<ItemStatusController>().visible.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h,
                              BASIC_PADDING * 2.w,
                              BASIC_PADDING * 2.h),
                          child: Column(
                            children: [
                              OptionDialogItem(),
                              OptionBtnSearch(ROUTE_MENU_ITEM_STATUS),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.find<ItemStatusController>().visible.value
                          ? BASIC_PADDING.h
                          : 0,
                    ),
                    Expanded(
                      child: Container(
                        child: ItemStatusTable(),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                        0.w,
                        0.h,
                        BASIC_PADDING * 2.w,
                        0.h),
                    child: FloatingActionButton.small(
                      child: OptionBtnVisible(
                          visible:
                              Get.find<ItemStatusController>().visible.value),
                      onPressed: () {
                        Get.find<ItemStatusController>().setVisible();
                      },
                      backgroundColor: context.theme.colorScheme.onTertiary,
                      elevation: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ItemStatusController extends GetxController {
  var controllerItemStatus;
  int totNormalBox = 0;
  int totNormalBottle = 0;
  int totPleasureBox = 0;
  int totPleasureBottle = 0;

  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramItemCode =
        Get.find<OptionDialogItemController>().paramItemCode.value;

    var param = user.getClientCode;
    var parsedItemStatusSales;

    if (paramItemCode == '') {
      ShowSnackBar(SNACK_TYPE.INFO, 'must_select_item'.tr);
      return;
    }

    try {
      dio = await reqApi(param);

      final response = await dio
          .get(API_SALES + API_SALES_ITEMSTATUS + '?code=' + paramItemCode);

      if (response.statusCode == 200) {
        if ((parsedItemStatusSales =
                await jsonDecode(jsonEncode(response.data))[TAG_DATA]) ==
            null) {
          ShowSnackBar(
              SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();
          //controllerItemStatus = parsedItemStatusSales.map((dataJson) => ItemStatusModel.fromJson(dataJson)).toList();
          controllerItemStatus =
              ItemStatusModel.fromJson(parsedItemStatusSales);

          totNormalBox = controllerItemStatus.normalBox.amount.round() +
              controllerItemStatus.normalBox.vat.round();
          totNormalBottle = controllerItemStatus.normalBottle.amount.round() +
              controllerItemStatus.normalBottle.vat.round();
          totPleasureBox = controllerItemStatus.pleasureBox.amount.round() +
              controllerItemStatus.pleasureBox.vat.round();
          totPleasureBottle =
              controllerItemStatus.pleasureBottle.amount.round() +
                  controllerItemStatus.pleasureBottle.vat.round();
        }
        Get.find<ItemStatusController>().setVisible();
        update();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO,
            e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    } catch (e) {
      print(e.toString());
      print("other error");
    }
  }

  void clearValue() {
    totNormalBox = 0;
    totNormalBottle = 0;
    totPleasureBox = 0;
    totPleasureBottle = 0;

    controllerItemStatus = null;
  }
}
