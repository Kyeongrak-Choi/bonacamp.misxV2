import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/menu/sales/sales_ledger/sales_ledger_list_model.dart';

import '../../../utils/utility.dart';

part 'purchase_report_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class PurchaseReportModel {
  var code; // 매입처 코드
  var name; // 매입처 명
  var purchase; // 매입금액
  var withdraw; // 출금액
  var balance;  // 채무잔액
  int? id;

  PurchaseReportModel(
      this.code, this.name, this.purchase, this.withdraw, this.balance, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'purchase': purchase,
      'withdraw': withdraw,
      'balance': balance,
    };
  }

  factory PurchaseReportModel.fromJson(Map<String, dynamic> json) => _$PurchaseReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseReportModelToJson(this);
}

List<PurchaseReportModel> generatePurchaseReportModelList(dataList, count) {
  return List.generate(
      count,
          (index) => PurchaseReportModel(
        dataList[index].code,
        dataList[index].name,
        numberFormat.format(dataList[index].purchase),
        numberFormat.format(dataList[index].withdraw),
        numberFormat.format(dataList[index].balance),
        id: index,
      ));
}
