import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'lend_report_customer_quantity_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class LendReportCustomerQuantityModel {
  var lastQuantity;
  var inQuantity;
  var outQuantity;
  var remainQuantity;
  var inRate;
  var remainRate;

  LendReportCustomerQuantityModel(this.lastQuantity, this.inQuantity, this.outQuantity, this.remainQuantity, this.inRate, this.remainRate);

  Map<String, dynamic> toMap() {
    return {
      'last-quantity': lastQuantity,
      'in-quantity': inQuantity,
      'out-quantity': outQuantity,
      'remain-quantity': remainQuantity,
      'in-rate': inRate,
      'remain-rate': remainRate,
    };
  }

  factory LendReportCustomerQuantityModel.fromJson(Map<String, dynamic> json) => _$LendReportCustomerQuantityModelFromJson(json);

  Map<String, dynamic> toJson() => _$LendReportCustomerQuantityModelToJson(this);
}