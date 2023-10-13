import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../layouts/menu/management/overall_status.dart';
import '../../../layouts/menu/sales/customer_info.dart';
import '../../../utils/utility.dart';
import '../../common/field/show_long_title_field.dart';
import '../../common/field/show_short_title_field.dart';

class CustomerInfoTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CustomerInfoController());
    return GetBuilder<CustomerInfoController>(builder: (CustomerInfoController controller) {
      return Container(
        color: context.theme.cardColor,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: ListView(
            children: [
              ShowLongTitleField(
                  titleName: '사업자번호',
                  value: controller.controllerCustomerInfoModel != null ?
                  numberFormat.format(controller.controllerCustomerInfoModel.businessNo) : '0'),

              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),

              ShowLongTitleField(
                  titleName: '대표자',
                  value: controller.controllerCustomerInfoRepresentativeModel != null ?
                  controller.controllerCustomerInfoRepresentativeModel.name : '0'),
              ShowLongTitleField(
                  titleName: 'C.P.',
                  value: controller.controllerCustomerInfoRepresentativeModel != null ?
                  controller.controllerCustomerInfoRepresentativeModel.phone : '0'),
              ShowLongTitleField(
                  titleName: '생년월일',
                  value: controller.controllerCustomerInfoRepresentativeModel != null ?
                  controller.controllerCustomerInfoRepresentativeModel.birthDay : '0'),

              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),

              ShowLongTitleField(
                  titleName: '영업담당',
                  value: controller.controllerCustomerInfoEmployeeModel != null ?
                  controller.controllerCustomerInfoEmployeeModel.salesRep : '0'),
              ShowLongTitleField(
                  titleName: '관리담당',
                  value: controller.controllerCustomerInfoEmployeeModel != null ?
                  controller.controllerCustomerInfoEmployeeModel.manager : '0'),

              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),

              ShowLongTitleField(
                  titleName: '전화번호1',
                  value: controller.controllerCustomerInfoModel != null ?
                  controller.controllerCustomerInfoModel.tel1 : '0'),
              ShowLongTitleField(
                  titleName: '전화번호2',
                  value: controller.controllerCustomerInfoModel != null ?
                  controller.controllerCustomerInfoModel.tel2 : '0'),
              ShowLongTitleField(
                  titleName: 'FAX',
                  value: controller.controllerCustomerInfoModel != null ?
                  controller.controllerCustomerInfoModel.fax : '0'),
              ShowLongTitleField(
                  titleName: 'e-Mail',
                  value: controller.controllerCustomerInfoModel != null ?
                  controller.controllerCustomerInfoModel.email : '0'),
              ShowLongTitleField(
                  titleName: 'Memo',
                  value: controller.controllerCustomerInfoEmployeeModel != null ?
                  controller.controllerCustomerInfoEmployeeModel.note : '0'),

              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),

              ShowLongTitleField(
                  titleName: '대표자주소',
                  value: controller.controllerCustomerInfoRepresentativeModel != null ?
                  controller.controllerCustomerInfoRepresentativeModel.address : '0'),
              ShowLongTitleField(
                  titleName: '사업장주소',
                  value: controller.controllerCustomerInfoModel != null ?
                  controller.controllerCustomerInfoModel.address : '0'),
            ],
          ),
        ),
      );
    });
  }
}
