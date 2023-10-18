import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/menu/card_radio_menu.dart';
import 'package:misxV2/models/system/notice.dart';

import '../../components/common/field/icon_title_field.dart';
import '../../components/common/field/show_list_header_row.dart';
import '../../utils/menu_manager.dart';
import '../../utils/utility.dart';

// System Config Setting
class Notice extends StatelessWidget {
  var dataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('system_setting'.tr),
        backgroundColor: context.theme.cardColor,
        iconTheme: context.theme.iconTheme,
      ),
      backgroundColor: context.theme.cardColor,
      body: SingleChildScrollView(
        child: Container(
          color: context.theme.cardColor,
          child: ExpansionPanelList.radio(
            animationDuration: Duration(milliseconds: 500),
            children: dataList.map<ExpansionPanelRadio>((NoticeModel model) {
              return ExpansionPanelRadio(
                value: model.title.toString(),
                backgroundColor: context.theme.cardColor,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ShowListHeaderRow(titleName: '', value: model.title.toString() ?? '');
                },
                body: Column(
                  children: [
                    IconTitleField(
                      titleName: '내용',
                      value: model.content,
                      iconData: Icons.add_box_outlined,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      )
    );
  }
}
