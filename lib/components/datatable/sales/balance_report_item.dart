import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/menu/sales/balance_report_model.dart';
import '../../../utils/theme/color_manager.dart';
import '../../../utils/utility.dart';

class BalanceReportItem extends StatelessWidget {
  var dataList;

  BalanceReportItem(var model) {
    dataList = generateBalanceReportList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.cardColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.theme.cardColor,
          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      '거래처',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '채권 잔액',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '상세',
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            ListView.separated(
              primary:  false,
              shrinkWrap: true,
              //padding: const EdgeInsets.all(10),
              itemCount: dataList.length,
              // Divider 로 구분자 추가.
              separatorBuilder: (BuildContext context, int index) => const Divider(
                height: 5,
                color: CommonColors.black,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          dataList[index].name ?? '',
                          style: context.textTheme.displaySmall,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          dataList[index].balance ?? '',
                          style: context.textTheme.displaySmall,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            ShowBalanceDetailDialog(dataList[index]);
                          },
                          icon: Icon(Icons.search, color: context.theme.primaryColor),
                        ),
                      )
                    ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
