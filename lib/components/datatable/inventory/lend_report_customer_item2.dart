import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misxV2/components/datatable/support/rental_report_detail_item.dart';

import '../../../layouts/menu/inventory/lend_report_customer.dart';
import '../../../models/menu/inventory/lend_report_customer_model.dart';
import '../../../models/menu/support/rental_report/rental_report_model.dart';
import '../../common/field/show_list_header_row.dart';
import 'lend_report_customer_detail_item.dart';

class LendReportCustomerItemtest extends StatefulWidget {
  const LendReportCustomerItemtest({Key? key}) : super(key: key);

  @override
  State<LendReportCustomerItemtest> createState() => LendReportCustomerItemtestState();
}

class LendReportCustomerItemtestState extends State<LendReportCustomerItemtest> {
  var dataList;

  LendReportCustomerItemtest(var model) {
    Get.find<LendReportCustomerController>().controllerLendReportCustomer
    = generateLendReportCustomerModelList(Get.find<LendReportCustomerController>().controllerLendReportCustomer, Get.find<LendReportCustomerController>().controllerLendReportCustomer!.length);
  }

  @override
  void initState() {
    Get.find<LendReportCustomerController>().controllerLendReportCustomer
    = generateLendReportCustomerModelList(Get.find<LendReportCustomerController>().controllerLendReportCustomer, Get.find<LendReportCustomerController>().controllerLendReportCustomer!.length);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(LendReportCustomerController());
    return SingleChildScrollView(
      child: Container(
        color: context.theme.cardColor,
        child: ExpansionPanelList(
          elevation: 0.0,
          expansionCallback: (index, isExpanded) {
            // setState(() {
            //   Get.find<LendReportCustomerController>().controllerLendReportCustomer![index].isExpanded = isExpanded;
            // });
            Get.find<LendReportCustomerController>().controllerLendReportCustomer![index].isExpanded = isExpanded;
          },
          animationDuration: Duration(milliseconds: 500),
          children: Get.find<LendReportCustomerController>().controllerLendReportCustomer!.map<ExpansionPanel>((LendReportCustomerModel model) {
            return ExpansionPanel(
                //value: model.id.toString(),
                isExpanded: Get.find<LendReportCustomerController>().controllerLendReportCustomer![model.id!].isExpanded,
                backgroundColor: context.theme.cardColor,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ShowListHeaderRow(titleName: '', value: model.name);
                },
                body: Column(
                  children: [
                    LendReportCustomerListHead(context),
                    SizedBox(height: 14),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.detailList.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return Container(padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0), child: LendReportCustomerDetailItem(model.detailList[idx]));
                        }),
                  ],
                ));
          }).toList(),
        ),
      ),
    );
  }

  Widget LendReportCustomerListHead(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            '용기공병',
            textAlign: TextAlign.center,
            style: context.textTheme.displayMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Text(
                '전일재고',
                textAlign: TextAlign.center,
                style: context.textTheme.displayMedium,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '입용기',
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '공용기',
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '공병',
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
