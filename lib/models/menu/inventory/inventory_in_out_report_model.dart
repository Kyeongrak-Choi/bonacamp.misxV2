import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

import 'quantity/inventory_report_quantity_model.dart';

part 'inventory_in_out_report_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class InventoryInOutReportModel {
  var itemCode;
  var itemName;
  var salesTypeCode;
  var salesType;
  var customerCode;
  var customerName;
  InventoryReportQuantityModel current;
  InventoryReportQuantityModel last;
  InventoryReportQuantityModel physical;
  InventoryReportQuantityModel inventoryIn;
  InventoryReportQuantityModel inventoryOut;

  int? id;

  InventoryInOutReportModel(
      this.itemCode,
      this.itemName,
      this.salesTypeCode,
      this.salesType,
      this.customerCode,
      this.customerName,
      this.current,
      this.last,
      this.physical,
      this.inventoryIn,
      this.inventoryOut,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'item-code': itemCode,
      'item-name': itemName,
      'sales-type-code': salesTypeCode,
      'sales-type': salesType,
      'customer-code': customerCode,
      'customer-name': customerName,
      'current': current,
      'last': last,
      'physical': physical,
      'in': inventoryIn,
      'out': inventoryOut,
    };
  }

  factory InventoryInOutReportModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryInOutReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryInOutReportModelToJson(this);
}

List<InventoryInOutReportModel> generateInventoryInOutReportModelList(
    dataList, count) {
  return List.generate(
      count,
      (index) => InventoryInOutReportModel(
            dataList[index].itemCode,
            dataList[index].itemName,
            dataList[index].salesTypeCode,
            dataList[index].salesType,
            dataList[index].customerCode,
            dataList[index].customerName,
            InventoryReportQuantityModel(
                numberFormat.format(dataList[index].current.box),
                numberFormat.format(dataList[index].current.bottle),
                numberFormat.format(dataList[index].current.total)),
            InventoryReportQuantityModel(
                numberFormat.format(dataList[index].last.box),
                numberFormat.format(dataList[index].last.bottle),
                numberFormat.format(dataList[index].last.total)),
            InventoryReportQuantityModel(
                numberFormat.format(dataList[index].physical.box),
                numberFormat.format(dataList[index].physical.bottle),
                numberFormat.format(dataList[index].physical.total)),
            InventoryReportQuantityModel(
                numberFormat.format(dataList[index].inventoryIn.box),
                numberFormat.format(dataList[index].inventoryIn.bottle),
                numberFormat.format(dataList[index].inventoryIn.total)),
            InventoryReportQuantityModel(
                numberFormat.format(dataList[index].inventoryOut.box),
                numberFormat.format(dataList[index].inventoryOut.bottle),
                numberFormat.format(dataList[index].inventoryOut.total)),
            id: index,
          ));
}
