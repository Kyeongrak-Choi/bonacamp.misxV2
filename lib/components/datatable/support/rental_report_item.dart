import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/datatable/support/rental_report_detail_item.dart';

import '../../../models/menu/support/rental_report/rental_report_model.dart';
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
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children: dataList.map<ExpansionPanelRadio>((RentalReportModel model) {
            return ExpansionPanelRadio(
                value: model.id.toString(),
                backgroundColor: context.theme.cardColor,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ShowListHeaderRow(titleName: '', value: model.name);
                },
                body: Column(
                  children: [
                    RentalListHead(context),
                    SizedBox(height: 14),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.detailList.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return Container(padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0), child: RentalReportDetailItem(model.detailList[idx]));
                        }),
                  ],
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
          flex: 3,
          child: Text(
            '구분',
            textAlign: TextAlign.center,
            style: context.textTheme.displayMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '차수',
            textAlign: TextAlign.center,
            style: context.textTheme.displayMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            '분납 완료일',
            textAlign: TextAlign.center,
            style: context.textTheme.displayMedium,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
