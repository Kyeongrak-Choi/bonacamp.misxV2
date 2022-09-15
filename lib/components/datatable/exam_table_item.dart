import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renew_misx/utils/constants.dart';
import 'package:renew_misx/models/exam_model.dart';
import '../../utils/theme/text_theme.dart';
import '../../utils/theme/theme_manager.dart';

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
                      style: textThemeDark().bodyText1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      examModel.type,
                      style: textThemeDark().bodyText1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      examModel.partNm,
                      style: textThemeDark().bodyText1,
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
                        style: textThemeDark().bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[ea] ' + examModel.ea.toString(),
                        style: textThemeDark().bodyText2,
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
                        style: textThemeDark().bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[공급가] ' + examModel.amt2.toString(),
                        style: textThemeDark().bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[부가세] ' + examModel.amt3.toString(),
                        style: textThemeDark().bodyText2,
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
                        style: textThemeDark().bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[입금액] ' + examModel.amt5.toString(),
                        style: textThemeDark().bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[채권잔액] ' + examModel.amt6.toString(),
                        style: textThemeDark().bodyText2,
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