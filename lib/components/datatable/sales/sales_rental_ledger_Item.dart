import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/menu/sales/sales_rental_ledger_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/utility.dart';
import '../../common/field/icon_title_field.dart';
import '../../common/field/show_list_header_row.dart';

class SalesRentalLedgerItem extends StatelessWidget {
  var dataList;

  SalesRentalLedgerItem(var model) {
    dataList = generateSalesRentalLedgerList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children:
              dataList.map<ExpansionPanelRadio>((SalesRentalLedgerModel model) {
            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: model.id.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(
                    titleName: changeStringToDateFormat(model.salesDate ?? ''),
                    value: '채권 + 대여금\n(' + model.totalBalance + ')');
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
                    model.memo != null
                        ? IconTitleField(
                            titleName: '설명',
                            value: model.memo,
                            iconData: Icons.label_outlined,
                          )
                        : Text(""),
                    IconTitleField(
                      titleName: '매출액',
                      value: model.total + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '공급가',
                      value: model.price + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '공급가 + 부가세',
                      value: model.amount + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '입금액',
                      value: model.deposit + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '채권잔액',
                      value: model.balance + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '대여금(장기)',
                      value: model.longRent + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '대여금(단기)',
                      value: model.shortRent + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '대여금(합계)',
                      value: model.totalRent + ' 원',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '채권 + 대여금',
                      value: model.totalBalance + ' 원',
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
