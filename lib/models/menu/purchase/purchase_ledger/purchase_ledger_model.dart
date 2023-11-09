import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/menu/purchase/purchase_ledger/purchase_ledger_list_model.dart';

part 'purchase_ledger_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class PurchaseLedgerModel {
  var code; // 매입처 코드
  var name; // 매입처 명
  var balance; // 채무잔액
  List<PurchaseLedgerListModel> dateList;
  int? id;

  PurchaseLedgerModel(
      this.code, this.name, this.balance, this.dateList, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'balance': balance,
      'list': dateList,
    };
  }

  factory PurchaseLedgerModel.fromJson(Map<String, dynamic> json) => _$PurchaseLedgerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseLedgerModelToJson(this);
}

List<PurchaseLedgerModel> generatePurchaseLedgerModelList(dataList, count) {
  return List.generate(
      count,
          (index) => PurchaseLedgerModel(
        dataList[index].code,
        dataList[index].name,
        dataList[index].balance,
        dataList[index].dateList,
        id: index,
      ));
}
