import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../layouts/dashboard.dart';
import 'dashboard_item.dart';

class DashBoardReturn extends StatelessWidget {
  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardController());
    return GetBuilder<DashBoardController>(builder: (DashBoardController controller) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [

          Container(
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(10),
                      child: Text(
                        'title_return'.tr,
                        textAlign: TextAlign.start,
                        style: context.textTheme.displayLarge,
                      ),
                    ),
                  ),
                  // dummy
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: DashBoardItem(
                        '반납계', controller.controllerReturnModel != null ? f.format(int.parse(controller.controllerReturnModel.oTot)) : '0'),
                  ),
                ],
              )),
        ],
      );
    });
  }
}
