import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/common/field/icon_title_field.dart';

import '../../../models/menu/support/rent_asset_history_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/utility.dart';
import '../../common/field/show_list_header_row.dart';

class RentAssetHistoryItem extends StatelessWidget {
  var dataList;

  RentAssetHistoryItem(var model) {
    dataList = generateRentAssetHistoryList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.canvasColor,
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children:
              dataList.map<ExpansionPanelRadio>((RentAssetHistoryModel model) {
            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: model.id.toString(),
              backgroundColor: context.theme.canvasColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ShowListHeaderRow(
                    titleName: model.name + ' (' + model.status + ')',
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
                      titleName: '처리일자',
                      value: changeStringToDateFormat(model.date ?? ''),
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '지원금액',
                      value: model.amount ?? 0,
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '자산구분',
                      value: model.type ?? '',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '시리얼번호',
                      value: model.serialNo ?? '',
                      iconData: Icons.label_outlined,
                    ),
                    IconTitleField(
                      titleName: '비고',
                      value: model.memo ?? '',
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
