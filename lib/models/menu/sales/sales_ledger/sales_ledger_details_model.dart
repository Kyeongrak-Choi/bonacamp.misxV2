import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'sales_ledger_details_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesLedgerDetailsModel {
  var itemCode;
  var itemName;
  var salesType;
  var salesTypeName;
  var boxQuantity;
  var bottleQuantity;
  var total;
  var price;
  var amount;
  var guarantee;
  var deposit;
  var balance;

  int? id;

  SalesLedgerDetailsModel(
      this.itemCode, this.itemName, this.salesType, this.salesTypeName, this.boxQuantity, this.bottleQuantity,
      this.total, this.price, this.amount, this.guarantee, this.deposit, this.balance, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'item-code': itemCode,
      'item-name': itemName,
      'sales-type': salesType,
      'sales-type-name': salesTypeName,
      'box-quantity': boxQuantity,
      'bottle-quantity': bottleQuantity,
      'total': total,
      'price': price,
      'amount': amount,
      'guarantee': guarantee,
      'deposit': deposit,
      'balance': balance,
    };
  }

  factory SalesLedgerDetailsModel.fromJson(Map<String, dynamic> json) => _$SalesLedgerDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesLedgerDetailsModelToJson(this);

}

List<SalesLedgerDetailsModel> generateSalesLedgerDetailsModelList(dataList, count) {
  return List.generate(
      count,
          (index) => SalesLedgerDetailsModel(
        dataList[index].itemCode,
        dataList[index].itemName,
        dataList[index].salesType,
        dataList[index].salesTypeName,
        numberFormat.format(dataList[index].boxQuantity),
        numberFormat.format(dataList[index].bottleQuantity),
        numberFormat.format(dataList[index].total),
        numberFormat.format(dataList[index].price),
        numberFormat.format(dataList[index].amount),
        numberFormat.format(dataList[index].guarantee),
        numberFormat.format(dataList[index].deposit),
        numberFormat.format(dataList[index].balance),
        id: index,
      ));
}
