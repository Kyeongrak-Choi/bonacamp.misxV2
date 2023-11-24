import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:misxV2/components/common/combobox/option_cb_branches.dart';
import 'package:misxV2/components/common/combobox/option_cb_business.dart';
import 'package:misxV2/components/common/combobox/option_cb_employee.dart';
import 'package:misxV2/components/common/combobox/option_two_content.dart';
import 'package:misxV2/components/common/datepicker/option_date_picker.dart';

import '../../../../components/common/button/option_btn_search.dart';
import '../../../../components/common/button/option_btn_visible.dart';
import '../../../../utils/constants.dart';
import '../../../components/common/combobox/option_cb_customer_status.dart';
import '../../../components/datatable/location/vendor_location_item.dart';
import '../../../models/menu/location/vendor_location_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class VendorLocation extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(VendorLocationController());
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('menu_sub_vendor_location'.tr),
              titleTextStyle: context.textTheme.displayLarge,
              backgroundColor: context.theme.canvasColor,
              iconTheme: context.theme.iconTheme,
              actions: [
                IconButton(
                  icon: OptionBtnVisible(visible: Get.find<VendorLocationController>().visible.value),
                  onPressed: () {
                    Get.find<VendorLocationController>().setVisible();
                  },
                ),
              ]),
          body: Container(
            color: context.theme.canvasColor,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
              child: Column(
                children: [
                  Visibility(
                    visible: Get.find<VendorLocationController>().visible.value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: Column(
                          children: [
                            OptionDatePicker(),
                            OptionTwoContent(OptionCbBranch(), OptionCbEmployee()),
                            OptionTwoContent(OptionCbCustomerStatus(), OptionCbBusiness()),
                            OptionBtnSearch(ROUTE_MENU_VENDORLOCATION),
                            //SizedBox(height: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.find<VendorLocationController>().visible.value ? 20 : 0,
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                          child: VendorLocationItem(),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class VendorLocationController extends GetxController {
  var visible = true.obs;
  var controllerVendorLocation;

  bool searchFlag = false;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramDt = DateFormat('yyyyMMdd').format(Get.find<DatePickerController>().date.value).toString();
    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramEmployeeCode = Get.find<CbEmployeeController>().paramEmployeeCode;
    String paramCustomerStatus = Get.find<CbCustomerStatusController>().paramCustomerStatusCode;
    String paramBusinessCode = Get.find<CbBusinessController>().paramBusinessCode;

    var param = user.getClientCode;
    var parsedVendorLocation;

    try {
      dio = await reqApi(param);
      final response = await dio.get(API_LOCATION +
          API_LOCATION_CUSTOMER +
          '?branch=' +
          paramBranchCode +
          '&date=' +
          paramDt +
          '&sales-rep=' +
          paramEmployeeCode +
          '&status=' +
          paramCustomerStatus +
          '&type=' +
          paramBusinessCode);

      if (response.statusCode == 200) {
        if ((parsedVendorLocation = await jsonDecode(jsonEncode(response.data))[TAG_DATA]) == null) {
          ShowSnackBar(SNACK_TYPE.INFO, jsonDecode(jsonEncode(response.data))[TAG_MSG]);
          clearValue();
        } else {
          clearValue();

          controllerVendorLocation = parsedVendorLocation.map((dataJson) => VendorLocationModel.fromJson(dataJson)).toList();
        }

        searchFlag = true;
        Get.find<VendorLocationController>().setVisible();
        update();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ShowSnackBar(SNACK_TYPE.INFO, e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    } catch (e) {
      print("other error");
    }
  }

  void clearValue() {
    controllerVendorLocation = null;
  }
}
