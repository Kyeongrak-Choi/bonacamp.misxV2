import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/datatable/support/rental_report_detail_item.dart';

import '../../../models/menu/support/rental_report/rental_report_model.dart';
import '../../../utils/constants.dart';
import '../../common/field/show_list_header_row.dart';

class RentalReportItem extends StatelessWidget {
  var dataList;

  RentalReportItem(var model) {
    dataList = generateRentalReportModelList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.canvasColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((RentalReportModel model) {
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
                      RentalListHead(context),
                      SizedBox(height: BASIC_PADDING.h),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.detailList.length,
                          itemBuilder: (BuildContext ctx, int idx) {
                            return Container(
                                padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING.w, 0.h, BASIC_PADDING.w, 0.h),
                                child: RentalReportDetailItem(model.detailList[idx]));
                          }),
                    ],
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }

  Widget RentalListHead(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            '구분',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '차수',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '분납 완료일',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
