import 'package:json_annotation/json_annotation.dart';

part '../current.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class DashboardStatusModel {
  var salesAmount; // 매출
  var purchaseAmount; // 매입
  var depositCollect; // 회수
  var depositAmount; // 입금
  var depositBalance; // 채권

  DashboardStatusModel(this.salesAmount, this.purchaseAmount, this.depositCollect, this.depositAmount, this.depositBalance);

  Map<String, dynamic> toMap() {
    return {
      'salesAmount': salesAmount,
      'purchaseAmount': purchaseAmount,
      'depositCollect': depositCollect,
      'depositAmount': depositAmount,
      'depositBalance': depositBalance,
    };
  }

  factory DashboardStatusModel.fromJson(Map<String, dynamic> json) => _$DashboardStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardStatusModelToJson(this);
}
