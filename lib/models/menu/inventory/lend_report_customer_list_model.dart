import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/menu/inventory/quantity/lend_report_customer_quantity_model.dart';

import 'quantity/lend_report_quantity_model.dart';

part 'lend_report_customer_list_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class LendReportCustomerListModel {
  var itemCode;
  var itemName;
  LendReportCustomerQuantityModel fullBox;
  LendReportCustomerQuantityModel box;
  LendReportCustomerQuantityModel bottle;

  LendReportCustomerListModel(this.itemCode, this.itemName, this.fullBox,
      this.box, this.bottle);

  Map<String, dynamic> toMap() {
    return {
      'item-code': itemCode,
      'item-name': itemName,
      'full-box': fullBox,
      'box': box,
      'bottle': bottle,
    };
  }

  factory LendReportCustomerListModel.fromJson(Map<String, dynamic> json) => _$LendReportCustomerListModelFromJson(json);

  Map<String, dynamic> toJson() => _$LendReportCustomerListModelToJson(this);
}