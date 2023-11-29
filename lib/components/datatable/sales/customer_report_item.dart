import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/sales/customer_report_model.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/show_list_detail_row.dart';
import '../../common/field/show_list_header_row.dart';

class CustomerReportItem extends StatelessWidget {
  var dataList;

  CustomerReportItem(var model) {
    dataList = generateCustomerReportList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.cardColor,
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
            ),
            onPressed: () {},
            child: ExpansionPanelList.radio(
              elevation: 0.0,
              animationDuration: Duration(milliseconds: 500),
              children: dataList.map<ExpansionPanelRadio>((CustomerReportModel model) {
                return ExpansionPanelRadio(
                  canTapOnHeader: true,
                  value: model.id.toString(),
                  backgroundColor: context.theme.cardColor,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ShowListHeaderRow(titleName: '', value: model.customerName.toString() ?? '');
                  },
                  body: Column(
                    children: [
                      IconTitleField(
                        titleName: '매출액',
                        value: model.total,
                        iconData: Icons.label_outlined,
                      ),
                      IconTitleField(
                        titleName: '공급가',
                        value: model.price,
                        iconData: Icons.label_outlined,
                      ),
                      IconTitleField(
                        titleName: '합계\n(공급가 + 부가세)',
                        value: model.amount,
                        iconData: Icons.label_outlined,
                      ),
                      IconTitleField(
                        titleName: '입금합계',
                        value: model.deposit,
                        iconData: Icons.label_outlined,
                      ),
                      IconTitleField(
                        titleName: '채권잔액',
                        value: model.balance,
                        iconData: Icons.label_outlined,
                      ),
                      IconTitleField(
                        titleName: '매출이익',
                        value: model.margin,
                        iconData: Icons.label_outlined,
                      ),
                      IconTitleField(
                        titleName: '마진율',
                        value: model.marginRate.toString()  ,
                        iconData: Icons.label_outlined,
                      ),
                    ],
                  ),
                );
              }).toList(),
            )),
      ),
    );
  }
}
