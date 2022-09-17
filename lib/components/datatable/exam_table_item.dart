import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/models/exam_model.dart';

class ExamTableItem extends StatelessWidget {
  List<ExamModel> list = generateData(7);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: context.theme.backgroundColor,
        child: ExpansionPanelList.radio(
          animationDuration: Duration(milliseconds: 1000),
          children: list.map<ExpansionPanelRadio>((ExamModel examModel) {
            return ExpansionPanelRadio(
              value: examModel.date,
              backgroundColor: context.theme.backgroundColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Row(
                  children: [
                    Text(
                      examModel.date,
                      style: context.textTheme.bodyText1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      examModel.type,
                      style: context.textTheme.bodyText1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      examModel.partNm,
                      style: context.textTheme.bodyText1,
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
                        style: context.textTheme.bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[ea] ' + examModel.ea.toString(),
                        style: context.textTheme.bodyText2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '[매출액] ' + examModel.amt1.toString(),
                        style: context.textTheme.bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[공급가] ' + examModel.amt2.toString(),
                        style: context.textTheme.bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[부가세] ' + examModel.amt3.toString(),
                        style: context.textTheme.bodyText2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '[보증금] ' + examModel.amt4.toString(),
                        style: context.textTheme.bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[입금액] ' + examModel.amt5.toString(),
                        style: context.textTheme.bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '[채권잔액] ' + examModel.amt6.toString(),
                        style: context.textTheme.bodyText2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
