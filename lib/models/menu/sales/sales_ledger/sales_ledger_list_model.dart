import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/menu/sales/sales_ledger/sales_ledger_details_model.dart';
import 'package:misxV2/utils/utility.dart';

part 'sales_ledger_list_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesLedgerListModel {
  var date;
  var balance;
  List<SalesLedgerDetailsModel> details;
  int? id;

  SalesLedgerListModel(
      this.date, this.balance, this.details, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'balance': balance,
      'details': details,
    };
  }

  factory SalesLedgerListModel.fromJson(Map<String, dynamic> json) => _$SalesLedgerListModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesLedgerListModelToJson(this);
}

List<SalesLedgerListModel> generateSalesLedgerListModelList(dataList, count) {
  return List.generate(
      count,
          (index) => SalesLedgerListModel(
        dataList[index].date,
        dataList[index].balance,
        dataList[index].details,
        id: index,
      ));
}
