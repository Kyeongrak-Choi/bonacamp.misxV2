import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/menu/purchase/purchase_ledger/purchase_ledger_details_model.dart';

part 'purchase_ledger_list_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class PurchaseLedgerListModel {
  var date;
  var balance;
  List<PurchaseLedgerDetailsModel> details;
  int? id;

  PurchaseLedgerListModel(
      this.date, this.balance, this.details, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'balance': balance,
      'details': details,
    };
  }

  factory PurchaseLedgerListModel.fromJson(Map<String, dynamic> json) => _$PurchaseLedgerListModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseLedgerListModelToJson(this);
}

List<PurchaseLedgerListModel> generatePurchaseLedgerListModelList(dataList, count) {
  return List.generate(
      count,
          (index) => PurchaseLedgerListModel(
        dataList[index].date,
        dataList[index].balance,
        dataList[index].details,
        id: index,
      ));
}
