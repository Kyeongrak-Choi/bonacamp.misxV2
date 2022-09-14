import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme.dart';
import 'exam_table.dart';

class ExamTableItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ExamTableItemController());

    return Obx(() => ExpansionPanelList(
          animationDuration: Duration(milliseconds: 500),
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Row(children: [
                  Text(
                    '일자',
                    style: textTheme().headline2,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '2022-06-13',
                    style: textTheme().headline2,
                  ),
                ]);
              },
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          '품목',
                          style: textTheme().headline2,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Text(
                          '[200074](신)맥주공박스',
                          style: textTheme().headline2,
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          '매출유형',
                          style: textTheme().headline2,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Text(
                          '매출',
                          style: textTheme().headline2,
                        )),
                      ],
                    ),
                  )
                ],
              ),
              isExpanded: Get.find<ExamTableItemController>().expanded.value,
              canTapOnHeader: true,
            ),
          ],
          expandedHeaderPadding: EdgeInsets.all(0),
          expansionCallback: (panelIndex, isExpanded) {
            Get.find<ExamTableItemController>().stateChange();
          },
        ));
  }
}

class ExamTableItemController extends GetxController {
  var expanded = false.obs;

  stateChange() async {
    expanded.value = !expanded.value;
  }
}
