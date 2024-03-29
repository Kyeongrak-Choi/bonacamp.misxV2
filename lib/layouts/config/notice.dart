import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:misxV2/models/system/notice.dart';
import 'package:misxV2/utils/constants.dart';

import '../../components/common/field/show_list_header_row.dart';

// System Config Setting
class Notice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(NoticeController());
    return Scaffold(
        backgroundColor: context.theme.canvasColor,
        appBar: AppBar(
          title: Text('notice'.tr),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                BASIC_PADDING * 2.w,
                BASIC_PADDING * 2.h,
                BASIC_PADDING * 2.w,
                BASIC_PADDING * 2.h),
            child: ExpansionPanelList.radio(
              elevation: 0.0,
              animationDuration: Duration(milliseconds: 500),
              children: Get.find<NoticeController>()
                  .data
                  .map<ExpansionPanelRadio>((NoticeModel model) {
                return ExpansionPanelRadio(
                  canTapOnHeader: true,
                  value: model.title.toString(),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ShowListHeaderRow(
                        titleName: model.regData,
                        value: model.title.toString() ?? '');
                  },
                  body: Text(
                    model.content,
                    style: context.textTheme.bodyLarge,
                  ),
                );
              }).toList(),
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
    data.add(NoticeModel('오픈', '경영관리 리뉴얼 버전을 오픈하였습니다.', '2023-12-11 리뉴얼 오픈'));
  }
}
