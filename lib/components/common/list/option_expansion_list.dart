import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../layouts/menu/management/sales_rank.dart';
import '../../../utils/constants.dart';
import '../../../utils/expansion_title_list.dart';
import 'option_expansion_listitem.dart';

class OptionExpansionList extends StatelessWidget {
  var menu;
  var expansionObjectList;
  List expansionTitleList = [];
  List itemNameList = [];
  List<List> expansionTitleValueList = [];
  List<List> itemValueList = [];

  int itemCount = 0;
  int buildCount = 0;

  OptionExpansionList(String menu) {
    this.menu = menu;
  }

  @override
  Widget build(BuildContext context) {
    switch (menu) {
      case ROUTE_MENU_SALES_DAILY:
        //expansionObjectList = Get.find<SalesDailyController>().salesRankList;
        itemNameList = salesDailyItemList;
        expansionTitleList = salesDailyTitleList;
        break;
      case ROUTE_MENU_RANKSTATUS:
        expansionObjectList = Get.find<SalesRankController>().salesRankList;
        itemNameList = salesRankItemList;
        expansionTitleList = salesRankTitleList;
        break;
    }
    itemCount = 0;
    return SingleChildScrollView(
      child: expansionObjectList != null
          ? Container(
              color: context.theme.backgroundColor,
              child: ExpansionPanelList.radio(
                animationDuration: Duration(milliseconds: 1000),
                children: expansionObjectList.map<ExpansionPanelRadio>((var expansionModel) {
                  itemValueList.add(objectItemValueToList(expansionModel));
                  expansionTitleValueList.add(objectItemTitleValueToList(expansionModel));
                  //itemCount = -1;
                  return ExpansionPanelRadio(
                      value: expansionModel,
                      backgroundColor: context.theme.backgroundColor,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        if (itemCount == expansionTitleValueList.length) itemCount = 0;
                        return OptionExpansionTitle(context, expansionTitleList[0], expansionTitleValueList[itemCount][0], expansionTitleList[1],
                            expansionTitleValueList[itemCount][1], expansionTitleList[2], expansionTitleValueList[itemCount++][2]);
                      },
                      // body:Text(
                      //   '[test ] ' + itemValueList[0],
                      //   style: context.textTheme.displaySmall,
                      // ),
                      body: OptionExpansionListItem(itemTilteList: itemNameList, itemValueList: itemValueList[itemCount++]));
                }).toList(),
              ),
            )
          : null,
    );
  }

  Widget OptionExpansionTitle(BuildContext context, String title1, String value1, String title2, String value2, String title3, String value3) {
    return Row(
      children: [
        Text(
          '[' + (title1 ?? '') + '] ' + value1 ?? '',
          style: context.textTheme.displayMedium,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: Text(
            '[' + (title2 ?? '') + '] ' + value2 ?? '',
            style: context.textTheme.displayMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: Text(
              '[' + (title3 ?? '') + '] ' + value3 ?? '',
              style: context.textTheme.displayMedium,
              overflow: TextOverflow.ellipsis,
            )),
      ],
    );
  }

  List objectItemTitleValueToList(var object) {
    List valueList = [];
    var f = NumberFormat('###,###,###,###');

    if (menu == ROUTE_MENU_SALES_DAILY) {
      valueList.add(object.teamCode);
      valueList.add(object.teamName);
      valueList.add(object.employeeCode);
    } else if (menu == ROUTE_MENU_RANKSTATUS) {
      valueList.add(object.ranking); // Title
      valueList.add(object.customerName);
      valueList.add(f.format(int.parse(object.salesAmount ?? '0')));
    }
    return valueList;
  }

  List objectItemValueToList(var object) {
    List valueList = [];
    var f = NumberFormat('###,###,###,###');

    if (menu == ROUTE_MENU_SALES_DAILY) {
      valueList.add(object.employeeName);
      valueList.add(object.divisionCode);
      valueList.add(object.divisionName);
      valueList.add(object.supplementAmount);
      valueList.add(object.vatAmount);
      valueList.add(object.guaranteeAmount);
      valueList.add(object.totalAmount);
      valueList.add(object.purchaseCost);
      valueList.add(object.profitAmount);
      valueList.add(object.profitRate);
      valueList.add(object.depositCash);
      valueList.add(object.depositEmptyCaseBottle);
      valueList.add(object.depositAmount);
      valueList.add(object.bondBalance);
    } else if (menu == ROUTE_MENU_RANKSTATUS) {
      valueList.add(object.ranking);
      valueList.add(object.customerName);
      valueList.add(f.format(int.parse(object.salesAmount ?? '0')));
      valueList.add(f.format(int.parse(object.supplementAmount ?? '0')));
      valueList.add(f.format(int.parse(object.profitAmount ?? '0')));
      valueList.add(object.profitRate);
      valueList.add(f.format(int.parse(object.bondBalance ?? '0')));
    }
    return valueList;
  }
}
