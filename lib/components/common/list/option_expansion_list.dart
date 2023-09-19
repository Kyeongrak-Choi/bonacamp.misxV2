import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/models/exam_model.dart';

import '../../../layouts/menu/management/sales_daily.dart';
import '../../../utils/constants.dart';
import '../../../utils/expansion_title_list.dart';
import 'option_expansion_listitem.dart';

class  OptionExpansionList extends StatelessWidget {

  var menu;
  var expansionObjectList;
  List expansionTitleList = [];
  List itemNameList = [];
  List itemValueList = [];

  OptionExpansionList({required this.menu,});



  @override
  Widget build(BuildContext context) {
    switch(menu) {
      case ROUTE_MENU_SALES_DAILY :
        expansionObjectList = Get.find<SalesDailyController>().salesDailyList;
        itemNameList = salesDailyItemList;
        expansionTitleList = salesDailyTitleList;
        break;
    }
    return SingleChildScrollView(
      child: Container(
        color: context.theme.backgroundColor,
        child: ExpansionPanelList.radio(
          animationDuration: Duration(milliseconds: 1000),
          children: expansionObjectList.map<ExpansionPanelRadio>((var expansionModel) {
            itemValueList = objectToList(expansionModel);
            return ExpansionPanelRadio(
              value: expansionTitleList[0],
              backgroundColor: context.theme.backgroundColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return OptionExpansionTitle(context, expansionTitleList[0], expansionTitleList[1], expansionTitleList[2]);
              },
              body: OptionExpansionListItem(itemTilteList : itemNameList, itemValueList : itemValueList)
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget OptionExpansionTitle(BuildContext context, String title1, String title2, String title3){
    return Row(
      children: [
        Text(
          title1 ?? '',
          style: context.textTheme.bodyText1,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title2 ?? '',
          style: context.textTheme.bodyText1,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title3 ?? '',
          style: context.textTheme.bodyText1,
        )
      ],
    );
  }

  List objectToList(var object){
    List valueList = [];

    if(menu == ROUTE_MENU_SALES_DAILY){
      valueList.add(object.employee_name);
    }


    return valueList;

  }
}
