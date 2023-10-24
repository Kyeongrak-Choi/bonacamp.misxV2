import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../layouts/menu/sales/customer_info.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';

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
              IconTitleField(
                titleName: '사업자번호',
                value: controller.controllerCustomerInfoModel != null ? convertBusinessNo(controller.controllerCustomerInfoModel.businessNo) ?? '' : '',
                iconData: Icons.label_outlined,
              ),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '대표자',
                value: controller.controllerCustomerInfoRepresentativeModel != null
                    ? controller.controllerCustomerInfoRepresentativeModel.name ?? ''
                    : '',
                iconData: Icons.person,
              ),
              IconTitleField(
                titleName: 'C.P.',
                value: controller.controllerCustomerInfoRepresentativeModel != null
                    ? controller.controllerCustomerInfoRepresentativeModel.phone ?? ''
                    : '',
                iconData: Icons.phone_android,
              ),
              IconTitleField(
                titleName: '생년월일',
                value: controller.controllerCustomerInfoRepresentativeModel != null
                    ? controller.controllerCustomerInfoRepresentativeModel.birthDay ?? ''
                    : '',
                iconData: Icons.label_outlined,
              ),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '영업담당',
                value: controller.controllerCustomerInfoEmployeeModel != null ? controller.controllerCustomerInfoEmployeeModel.salesRep ?? '' : '',
                iconData: Icons.person,
              ),
              IconTitleField(
                titleName: '관리담당',
                value: controller.controllerCustomerInfoEmployeeModel != null ? controller.controllerCustomerInfoEmployeeModel.manager ?? '' : '',
                iconData: Icons.person,
              ),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '전화번호1',
                value: controller.controllerCustomerInfoModel != null ? controller.controllerCustomerInfoModel.tel1 ?? '' : '',
                iconData: Icons.phone,
              ),
              IconTitleField(
                titleName: '전화번호2',
                value: controller.controllerCustomerInfoModel != null ? controller.controllerCustomerInfoModel.tel2 ?? '' : '',
                iconData: Icons.phone,
              ),
              IconTitleField(
                titleName: 'FAX',
                value: controller.controllerCustomerInfoModel != null ? controller.controllerCustomerInfoModel.fax ?? '' : '',
                iconData: Icons.fax_rounded,
              ),
              IconTitleField(
                titleName: 'e-Mail',
                value: controller.controllerCustomerInfoEmployeeModel != null ? controller.controllerCustomerInfoEmployeeModel.email ?? '' : '',
                iconData: Icons.mail,
              ),
              IconTitleField(
                titleName: 'Memo',
                value: controller.controllerCustomerInfoModel != null ? controller.controllerCustomerInfoModel.note ?? '' : '',
                iconData: Icons.label_outlined,
              ),
              Container(
                  width: 500,
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                  child: Divider(color: context.theme.primaryColor, thickness: 0.5)),
              IconTitleField(
                titleName: '대표자주소',
                value: controller.controllerCustomerInfoRepresentativeModel != null
                    ? controller.controllerCustomerInfoRepresentativeModel.address ?? ''
                    : '',
                iconData: Icons.home,
              ),
              IconTitleField(
                titleName: '사업장주소',
                value: controller.controllerCustomerInfoModel != null ? controller.controllerCustomerInfoModel.address ?? '' : '',
                iconData: Icons.home,
              ),
            ],
          ),
        ),
      );
    });
  }
}
