import 'package:json_annotation/json_annotation.dart';

import '../../../utils/utility.dart';

part 'sales_class_status.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesClassStatusModel {
  var salesClassCode; // 판매분류 유형코드
  var salesClassName; // 판매분류 유형명
  var boxQuantity; // 상자수량
  var bottleQuantity; // 병수량
  var supplementAmount; // 공급가
  var total; // 총금액
  var purchaseAmount; // 매출원가
  var profitAmount; // 마진액
  var profitRate; // 마진율
  var profitStandard; // 마진액 기준
  int? id;

  SalesClassStatusModel(
      this.salesClassCode,
      this.salesClassName,
      this.boxQuantity,
      this.bottleQuantity,
      this.supplementAmount,
      this.total,
      this.purchaseAmount,
      this.profitAmount,
      this.profitRate,
      this.profitStandard,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'sales-class-code': salesClassCode,
      'sales-class-name': salesClassName,
      'box-quantity': boxQuantity,
      'bottle-quantity': bottleQuantity,
      'supplement-amount': supplementAmount,
      'total': total,
      'purchase-amount': purchaseAmount,
      'profit-amount': profitAmount,
      'profit-rate': profitRate,
      'profit-standard': profitStandard,
    };
  }

  factory SalesClassStatusModel.fromJson(Map<String, dynamic> json) =>
      _$SalesClassStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesClassStatusModelToJson(this);
}

List<SalesClassStatusModel> generateList(dataList, count) {
  return List.generate(
      count,
      (index) => SalesClassStatusModel(
          dataList[index].salesClassCode,
          dataList[index].salesClassName,
          dataList[index].boxQuantity,
          dataList[index].bottleQuantity,
          numberFormat.format(dataList[index].supplementAmount),
          numberFormat.format(dataList[index].total),
          numberFormat.format(dataList[index].purchaseAmount),
          numberFormat.format(dataList[index].profitAmount),
          dataList[index].profitRate,
          numberFormat.format(dataList[index].profitStandard),
          id: index));
}
