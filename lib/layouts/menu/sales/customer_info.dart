import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/components/common/button/option_btn_visible.dart';
import 'package:misxV2/components/common/dialog/customer/option_dialog_customer.dart';

import '../../../components/chart/customer_info_graph.dart';
import '../../../components/common/button/option_btn_search.dart';
import '../../../components/common/combobox/option_cb_branches.dart';
import '../../../components/common/combobox/option_two_content.dart';
import '../../../components/common/emptyWidget.dart';
import '../../../components/datatable/sales/customer_info_item.dart';
import '../../../models/common/chart_spot.dart';
import '../../../models/menu/sales/customer_info/customer_info_employee_model.dart';
import '../../../models/menu/sales/customer_info/customer_info_model.dart';
import '../../../models/menu/sales/customer_info/customer_info_representative_model.dart';
import '../../../models/menu/sales/customer_info/customer_info_sales_model.dart';
import '../../../models/system/userinfo.dart';
import '../../../utils/constants.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/utility.dart';

class CustomerInfo extends StatelessWidget {
  @override
  Widget build(context) {
    Get.put(CustomerInfoController());
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text('menu_sub_customer_info'.tr), actions: []),
          body: Container(
            color: context.theme.colorScheme.background,
            child: Stack(
              children: [
                Column(
                  children: [
                    Visibility(
                        visible: Get.find<CustomerInfoController>()
                            .visible
                            .value,
                        child: Column(
                          children: [
                            Container(
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
                                    OptionTwoContent(OptionDialogCustomer(),
                                        OptionCbBranch()),
                                    OptionBtnSearch(
                                        ROUTE_MENU_CUSTOMER_INFO),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height:
                          Get.find<CustomerInfoController>().visible.value
                              ? BASIC_PADDING.h
                              : 0,
                    ),
                    Expanded(
                      flex: Get.find<CustomerInfoController>().visible.value
                          ? 4
                          : 3,
                      child: Container(
                        child: setChild(),
                      ),
                    ),
                    SizedBox(
                      height: BASIC_PADDING.h,
                    ),
                    Expanded(
                      flex: Get.find<CustomerInfoController>().visible.value
                          ? 6
                          : 7,
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
                          child: CustomerInfoTable(),
                        ),
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
                              Get.find<CustomerInfoController>().visible.value),
                      onPressed: () {
                        Get.find<CustomerInfoController>().setVisible();
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

  Widget setChild() {
    if (Get.find<CustomerInfoController>().spotListSales.length > 0) {
      return CustomerInfoGraph();
    } else {
      return EmptyWidget();
    }
  }
}

class CustomerInfoController extends GetxController {
  var controllerCustomerInfoModel;
  var controllerCustomerInfoRepresentativeModel;
  var controllerCustomerInfoEmployeeModel;
  var controllerCustomerInfoSalesModel;

  List<ChartSpot> spotListSales = [];
  List<ChartSpot> spotListBalance = [];

  var visible = true.obs;

  setVisible() async {
    visible.value = !visible.value;
  }

  Future showResult() async {
    UserinfoModel user = Hive.box(LOCAL_DB).get(KEY_USERINFO); // USER_INFO save
    var dio;

    String paramBranchCode = Get.find<CbBranchController>().paramBranchCode;
    String paramCustCode =
        Get.find<OptionDialogCustomerController>().paramCustomerCode.value ??
            '';

    if (paramCustCode == '') {
      ShowSnackBar(SNACK_TYPE.INFO, 'must_select_customer'.tr);
      return;
    }

    var param = user.getClientCode;
    var parsedDataCustomerInfo;
    var parsedDataCustomerInfoRepre;
    var parsedDataCustomerInfoEmp;
    var parsedDataCustomerInfoSales;

    try {
      dio = await reqApi(param);

      final response = await dio.get(API_SALES +
          API_SALES_CUSTOMERINFO +
          '?branch=' +
          paramBranchCode +
          '&code=' +
          paramCustCode);

      if (response.statusCode == 200) {
        spotListSales.clear();
        spotListBalance.clear();

        parsedDataCustomerInfo =
            await jsonDecode(jsonEncode(response.data))[TAG_DATA];
        parsedDataCustomerInfoRepre =
            await jsonDecode(jsonEncode(response.data))[TAG_DATA]
                [TAG_REPRESENTATIVE];
        parsedDataCustomerInfoEmp =
            await jsonDecode(jsonEncode(response.data))[TAG_DATA][TAG_EMPLOYEE];
        parsedDataCustomerInfoSales =
            await jsonDecode(jsonEncode(response.data))[TAG_DATA]
                [TAG_SALESSUMMARIES] as List;

        controllerCustomerInfoModel =
            CustomerInfoModel.fromJson(parsedDataCustomerInfo);
        controllerCustomerInfoRepresentativeModel =
            CustomerInfoRepresentativeModel.fromJson(
                parsedDataCustomerInfoRepre);
        controllerCustomerInfoEmployeeModel =
            CustomerInfoEmployeeModel.fromJson(parsedDataCustomerInfoEmp);
        controllerCustomerInfoSalesModel = parsedDataCustomerInfoSales
            .map((dataJson) => CustomerInfoSalesModel.fromJson(dataJson))
            .toList();

        for (var list in parsedDataCustomerInfoSales) {
          spotListSales
              .add(ChartSpot(list['title'].toString(), list['sales-amount']));
          spotListBalance
              .add(ChartSpot(list['title'].toString(), list['balance']));
        }

        Get.find<CustomerInfoController>().setVisible();
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
}
