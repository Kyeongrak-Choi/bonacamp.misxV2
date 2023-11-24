import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'purchase_ledger_details_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class PurchaseLedgerDetailsModel {
  var itemCode;
  var itemName;
  var boxQuantity;
  var bottleQuantity;
  var total;
  var price;
  var withdraw;
  var balance;

  int? id;

  PurchaseLedgerDetailsModel(this.itemCode, this.itemName, this.boxQuantity, this.bottleQuantity, this.total, this.price, this.withdraw, this.balance,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'item-code': itemCode,
      'item-name': itemName,
      'box-quantity': boxQuantity,
      'bottle-quantity': bottleQuantity,
      'total': total,
      'price': price,
      'withdraw': withdraw,
      'balance': balance,
    };
  }

  factory PurchaseLedgerDetailsModel.fromJson(Map<String, dynamic> json) => _$PurchaseLedgerDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseLedgerDetailsModelToJson(this);
}

List<PurchaseLedgerDetailsModel> generatePurchaseLedgerDetailsModelList(dataList, count) {
  return List.generate(
      count,
      (index) => PurchaseLedgerDetailsModel(
            dataList[index].itemCode,
            dataList[index].itemName,
            numberFormat.format(dataList[index].boxQuantity),
            numberFormat.format(dataList[index].bottleQuantity),
            numberFormat.format(dataList[index].total),
            numberFormat.format(dataList[index].price),
            numberFormat.format(dataList[index].withdraw),
            numberFormat.format(dataList[index].balance),
            id: index,
          ));
}
