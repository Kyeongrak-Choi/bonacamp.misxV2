import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renew_misx/constants.dart';
import 'package:renew_misx/models/exam_model.dart';
import '../../theme.dart';
import 'exam_table.dart';

class ExamTableItem extends StatelessWidget {
  List<ExamModel> list = generateData(7);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList.radio(
          animationDuration: Duration(milliseconds: 1000),
          children: list.map<ExpansionPanelRadio>((ExamModel examModel) {
            return ExpansionPanelRadio(
              value: examModel.date,
              backgroundColor: Color(AppColor),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Row(
                  children: [
                    Text(
                      examModel.date,
                      style: textTheme().headline3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      examModel.type,
                      style: textTheme().headline3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      examModel.partNm,
                      style: textTheme().headline3,
                    )
                  ],
                );
              },
              body: Column(
                //padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                children: [
                  Row(
                    children: [
                      Text(
                        '[BOX] ' + examModel.box.toString(),
                        style: textTheme().headline4,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[ea] ' + examModel.ea.toString(),
                        style: textTheme().headline4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '[매출액] ' + examModel.amt1.toString(),
                        style: textTheme().headline4,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[공급가] ' + examModel.amt2.toString(),
                        style: textTheme().headline4,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[부가세] ' + examModel.amt3.toString(),
                        style: textTheme().headline4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '[보증금] ' + examModel.amt4.toString(),
                        style: textTheme().headline4,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[입금액] ' + examModel.amt5.toString(),
                        style: textTheme().headline4,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[채권잔액] ' + examModel.amt6.toString(),
                        style: textTheme().headline4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// class ExamTableItemController extends GetxController {
//   var expanded = false.obs;
//
//   stateChange() async {
//     expanded.value = !expanded.value;
//   }
// }
