import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sales_class_status.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesClassStatusModel {
  String? salesClassCode; // 판매분류 유형코드
  String? salesClassName; // 판매분류 유형명
  String? boxQuantity; // 상자수량
  String? bottleQuantity; // 병수량
  String? supplementAmount; // 공급가
  String? totalAmount; // 총금액
  String? purchaseAmount; // 매출원가
  String? profitAmount; // 마진액
  String? profitRate; // 마진율
  String? profitStandard; // 마진액 기준
  int? id;

  SalesClassStatusModel(this.salesClassCode, this.salesClassName, this.boxQuantity, this.bottleQuantity, this.supplementAmount, this.totalAmount,
      this.purchaseAmount, this.profitAmount, this.profitRate, this.profitStandard,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'sales-class-code': salesClassCode,
      'sales-class-name': salesClassName,
      'box-quantity': boxQuantity,
      'bottle-quantity': bottleQuantity,
      'supplement-amount': supplementAmount,
      'total-amount': totalAmount,
      'purchase-amount': purchaseAmount,
      'profit-amount': profitAmount,
      'profit-rate': profitRate,
      'profit-standard': profitStandard,
    };
  }

  factory SalesClassStatusModel.fromJson(Map<String, dynamic> json) => _$SalesClassStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesClassStatusModelToJson(this);
}

List<SalesClassStatusModel> generateList(dataList, count) {
  var f = NumberFormat('###,###,###,###');
  return List.generate(
      count,
      (index) => SalesClassStatusModel(
          dataList[index].salesClassCode,
          dataList[index].salesClassName,
          dataList[index].boxQuantity,
          dataList[index].bottleQuantity,
          f.format(int.parse(dataList[index].supplementAmount ?? 0)),
          f.format(int.parse(dataList[index].totalAmount ?? 0)),
          f.format(int.parse(dataList[index].purchaseAmount ?? 0)),
          f.format(int.parse(dataList[index].profitAmount ?? 0)),
          dataList[index].profitRate,
          dataList[index].profitStandard,
          id: index));
}
