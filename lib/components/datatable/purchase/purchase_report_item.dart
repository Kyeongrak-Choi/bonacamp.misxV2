import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/menu/purchase/purchase_report_model.dart';
import '../../../utils/constants.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/show_list_header_row.dart';

class PurchaseReportItem extends StatelessWidget {
  var dataList;

  PurchaseReportItem(var model) {
    dataList = generatePurchaseReportModelList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.canvasColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((PurchaseReportModel model) {
            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: model.id.toString(),
              backgroundColor: context.theme.canvasColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(titleName: model.name ?? '', value: '');
              },
              body: Container(
                padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w, BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 2.h),
                color: context.theme.colorScheme.background,
                child: Column(
                  children: [
                    IconTitleField(
                      titleName: '매입액',
                      value: model.purchase ?? '',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '출금합계',
                      value: model.withdraw ?? '',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '채무잔액',
                      value: model.balance ?? '',
                      iconData: Icons.label_outlined,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
