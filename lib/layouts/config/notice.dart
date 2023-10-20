import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/models/system/notice.dart';

import '../../components/common/field/icon_title_field.dart';
import '../../components/common/field/show_list_header_row.dart';

// System Config Setting
class Notice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(NoticeController());
    return Scaffold(
        appBar: AppBar(
          title: Text('notice'.tr),
          titleTextStyle: context.textTheme.displayLarge,
          backgroundColor: context.theme.canvasColor,
          iconTheme: context.theme.iconTheme,
        ),
        body: Container(
          color: context.theme.canvasColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ExpansionPanelList.radio(
                    elevation: 0.0,
                    animationDuration: Duration(milliseconds: 500),
                    children: Get.find<NoticeController>().data.map<ExpansionPanelRadio>((NoticeModel model) {
                      return ExpansionPanelRadio(
                        canTapOnHeader: true,
                        value: model.title.toString(),
                        backgroundColor: context.theme.cardColor,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ShowListHeaderRow(titleName: model.regData, value: model.title.toString() ?? '');
                        },
                        body: Text(model.content),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class NoticeController extends GetxController {
  List<NoticeModel> data = <NoticeModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setNoticeData();
  }

  void setNoticeData() {
    data.add(NoticeModel('테스트1', '탁월한 성취 뒤에는\n언제나 끝까지 버티는 힘이 숨어있다.' + '\n버티면 끝내 이긴다.\n\n<앤드류 매튜스>\n\n', '2023-10-01'));
    data.add(NoticeModel('테스트2', '삶을 변화시키려면 쓴소리를 찾아다녀야 한다\n위로나 희망에 중독되면 현실에 대한\n진단은 오진이 되기 쉽고,' + '\n삶을 바꿔보려는 실천력도 점점 사라진다.\n\n', '2023-10-12'));
  }
}
