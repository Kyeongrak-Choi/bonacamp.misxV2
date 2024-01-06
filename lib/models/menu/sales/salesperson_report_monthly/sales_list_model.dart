import 'package:json_annotation/json_annotation.dart';

part 'sales_list_model.g.dart'; // *.g.dart : in same directory

// 차트 Spot 모델
@JsonSerializable(explicitToJson: true)
class SalesListModel {
  var month; // 연월
  var amount; // 금액

  SalesListModel(this.month, this.amount);

  Map<String, dynamic> toMap() {
    return {
      'month': month,
      'amount': amount,
    };
  }

  factory SalesListModel.fromJson(Map<String, dynamic> json) =>
      _$SalesListModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesListModelToJson(this);

  get getMonth => month;

  get getAmount => amount;
}
