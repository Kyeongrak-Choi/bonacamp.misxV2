import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/field/icon_title_field.dart';

import '../../../models/menu/management/sales_rank_model.dart';
import '../../../utils/constants.dart';
import '../../common/field/show_list_header_row.dart';

class SalesRankItem extends StatelessWidget {
  var dataList;

  SalesRankItem(var model) {
    dataList = generateSalesRankList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((SalesRankModel model) {
            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: model.id.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(
                    titleName:
                        model.ranking.toString() + '. ' + model.customerName ??
                            '',
                    value: '');
              },
              body: Container(
                padding: EdgeInsetsDirectional.fromSTEB(
                    BASIC_PADDING * 2.w,
                    BASIC_PADDING * 2.h,
                    BASIC_PADDING * 2.w,
                    BASIC_PADDING * 2.h),
                color: context.theme.colorScheme.background,
                child: Column(
                  children: [
                    IconTitleField(
                      titleName: '매출액',
                      value: model.salesAmount.toString() + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '공급가',
                      value: model.supplementAmount.toString() + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '매출이익',
                      value: model.profitAmount.toString() + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '마진율',
                      value: model.profitRate.toString() + ' %',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '채권잔액',
                      value: model.bondBalance.toString() + ' 원',
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
