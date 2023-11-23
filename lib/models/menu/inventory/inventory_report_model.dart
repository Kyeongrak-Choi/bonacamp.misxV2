import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

import 'inventory_report_quantity_model.dart';

part 'inventory_report_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class InventoryReportModel {
  var itemCode;
  var itemName;
  var boxQuantity;
  var bottleQuantity;
  var amount;
  var customerCode;
  var customerName;
  InventoryReportQuantityModel sales;
  InventoryReportQuantityModel purchase;
  var packageQuantity;
  var liquorType;
  var salesTypeCode;
  var salesType;
  var itemType;
  var useCode;
  var use;

  int? id;

  InventoryReportModel(this.itemCode, this.itemName, this.boxQuantity,
      this.bottleQuantity, this.amount, this.customerCode, this.customerName,
      this.sales, this.purchase, this.packageQuantity, this.liquorType,
      this.salesTypeCode, this.salesType, this.itemType, this.useCode, this.use,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'item-code': itemCode,
      'item-name': itemName,
      'box-quantity': boxQuantity,
      'bottle-quantity': bottleQuantity,
      'amount': amount,
      'customer-code': customerCode,
      'customer-name': customerName,
      'sales': sales,
      'purchase': purchase,
      'package-quantity': packageQuantity,
      'liquor-type': liquorType,
      'sales-type-code': salesTypeCode,
      'sales-type': salesType,
      'item-type': itemType,
      'use-code': useCode,
      'use': use,
    };
  }

  factory InventoryReportModel.fromJson(Map<String, dynamic> json) => _$InventoryReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryReportModelToJson(this);
}

List<InventoryReportModel> generateInventoryReportModelList(dataList, count) {
  return List.generate(
      count,
      (index) => InventoryReportModel(
            dataList[index].itemCode,
            dataList[index].itemName,
            numberFormat.format(dataList[index].boxQuantity),
            numberFormat.format(dataList[index].bottleQuantity),
            numberFormat.format(dataList[index].amount),
            dataList[index].customerCode,
            dataList[index].customerName,
            InventoryReportQuantityModel(
              numberFormat.format(dataList[index].sales.box),
              numberFormat.format(dataList[index].sales.bottle)),
            InventoryReportQuantityModel(
                numberFormat.format(dataList[index].purchase.box),
                numberFormat.format(dataList[index].purchase.bottle)),
            numberFormat.format(dataList[index].packageQuantity),
            dataList[index].liquorType,
            dataList[index].salesTypeCode,
            dataList[index].salesType,
            dataList[index].itemType,
            dataList[index].useCode,
            dataList[index].use,

            id: index,
          ));
}
