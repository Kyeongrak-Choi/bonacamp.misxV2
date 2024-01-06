import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

import 'quantity/lend_report_quantity_model.dart';

part 'lend_report_warehouse_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class LendReportWarehouseModel {
  var transItemCode;
  var lendItemName;
  var obtinQuantity;
  var standard;
  var container;
  var containerName;
  LendReportQuantityModel last;
  LendReportQuantityModel current;
  LendReportQuantityModel inventoryIn;
  LendReportQuantityModel inventoryOut;

  int? id;

  LendReportWarehouseModel(
      this.transItemCode,
      this.lendItemName,
      this.obtinQuantity,
      this.standard,
      this.container,
      this.containerName,
      this.last,
      this.current,
      this.inventoryIn,
      this.inventoryOut,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'trans-item-code': transItemCode,
      'lend-item-name': lendItemName,
      'obtin-quantity': obtinQuantity,
      'standard': standard,
      'container': container,
      'container-name': containerName,
      'last': last,
      'current': current,
      'in': inventoryIn,
      'out': inventoryOut,
    };
  }

  factory LendReportWarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$LendReportWarehouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LendReportWarehouseModelToJson(this);
}

List<LendReportWarehouseModel> generateLendReportWarehouseModelList(
    dataList, count) {
  return List.generate(
      count,
      (index) => LendReportWarehouseModel(
            dataList[index].transItemCode,
            dataList[index].lendItemName,
            dataList[index].obtinQuantity,
            dataList[index].standard,
            dataList[index].container,
            dataList[index].containerName,
            LendReportQuantityModel(
                numberFormat.format(dataList[index].last.bottleQuantity),
                numberFormat.format(dataList[index].last.equipQuantity),
                numberFormat.format(dataList[index].last.quantity)),
            LendReportQuantityModel(
                numberFormat.format(dataList[index].current.bottleQuantity),
                numberFormat.format(dataList[index].current.equipQuantity),
                numberFormat.format(dataList[index].current.quantity)),
            LendReportQuantityModel(
                numberFormat.format(dataList[index].inventoryIn.bottleQuantity),
                numberFormat.format(dataList[index].inventoryIn.equipQuantity),
                numberFormat.format(dataList[index].inventoryIn.quantity)),
            LendReportQuantityModel(
                numberFormat
                    .format(dataList[index].inventoryOut.bottleQuantity),
                numberFormat.format(dataList[index].inventoryOut.equipQuantity),
                numberFormat.format(dataList[index].inventoryOut.quantity)),
            id: index,
          ));
}
