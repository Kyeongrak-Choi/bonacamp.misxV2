import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sales_daily_division_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesDailyDivisionModel {
  String? itemCode; // 품목코드
  String? itemName; // 품목명
  String? usageCode; // 용도코드
  String? usageName; // 용도명
  String? boxQuantity; // 박스수량
  String? bottleQuantity; // 병수량
  String? amount; // 총계(공+부+보증금)
  String? pleasureBoxTotalQuantity; // 유흥 박스수량 누계
  String? pleasureBottleTotalQuantity; // 유흥 병수량 누계
  String? pleasureTotalAmount; // 유흥누계 금액
  String? normalBoxTotalQuantity; // 일반 수량(박스) 누계
  String? normalBottleTotalQuantity; // 일반 수량(병) 누계
  String? normalTotalAmount; // 일반누계 금액
  String? boxTotalQuantity; // 박스 누계 금액
  String? bottleTotalQuantity; // 병 누계 금액
  String? totalAmount; // 전체누계금액
  int? id;

  SalesDailyDivisionModel(
      this.itemCode,
      this.itemName,
      this.usageCode,
      this.usageName,
      this.boxQuantity,
      this.bottleQuantity,
      this.amount,
      this.pleasureBoxTotalQuantity,
      this.pleasureBottleTotalQuantity,
      this.pleasureTotalAmount,
      this.normalBoxTotalQuantity,
      this.normalBottleTotalQuantity,
      this.normalTotalAmount,
      this.boxTotalQuantity,
      this.bottleTotalQuantity,
      this.totalAmount,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'item-code': itemCode,
      'item-name': itemName,
      'usage-code': usageCode,
      'usage-name': usageName,
      'box-quantity': boxQuantity,
      'bottle-quantity': bottleQuantity,
      'amount': amount,
      'pleasure-box-total-quantity': pleasureBoxTotalQuantity,
      'pleasure-bottle-total-quantity': pleasureBottleTotalQuantity,
      'pleasure-total-amount': pleasureTotalAmount,
      'normal-box-total-quantity': normalBoxTotalQuantity,
      'normal-bottle-total-quantity': normalBottleTotalQuantity,
      'normal-total-amount': normalTotalAmount,
      'box-total-quantity': boxTotalQuantity,
      'bottle-total-quantity': bottleTotalQuantity,
      'total-amount': totalAmount,
    };
  }

  factory SalesDailyDivisionModel.fromJson(Map<String, dynamic> json) => _$SalesDailyDivisionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesDailyDivisionModelToJson(this);

  String? get getItemCode => itemCode;

  set setItemCode(String value) {
    itemCode = value;
  }

  String? get getItemName => itemName;

  set setItemName(String value) {
    itemName = value;
  }

  String? get getUsageCode => usageCode;

  set setUsageCode(String value) {
    usageCode = value;
  }

  String? get getUsageName => usageName;

  set setUsageName(String value) {
    usageName = value;
  }

  String? get getBoxQuantity => boxQuantity;

  set setBoxQuantity(String value) {
    boxQuantity = value;
  }

  String? get getBottleQuantity => bottleQuantity;

  set setBottleQuantity(String value) {
    bottleQuantity = value;
  }

  String? get getAmount => amount;

  set setAmount(String value) {
    amount = value;
  }

  String? get getPleasureBoxTotalQuantity => pleasureBoxTotalQuantity;

  set setPleasureBoxTotalQuantity(String value) {
    pleasureBoxTotalQuantity = value;
  }

  String? get getPleasureBottleTotalQuantity => pleasureBottleTotalQuantity;

  set setPleasureBottleTotalQuantity(String value) {
    pleasureBottleTotalQuantity = value;
  }

  String? get getPleasureTotalAmount => pleasureTotalAmount;

  set setPleasureTotalAmount(String value) {
    pleasureTotalAmount = value;
  }

  String? get getNormalBoxTotalQuantity => normalBoxTotalQuantity;

  set setNormalBoxTotalQuantity(String value) {
    normalBoxTotalQuantity = value;
  }

  String? get getNormalBottleTotalQuantity => normalBottleTotalQuantity;

  set setNormalBottleTotalQuantity(String value) {
    normalBottleTotalQuantity = value;
  }

  String? get getNormalTotalAmount => normalTotalAmount;

  set setNormalTotalAmount(String value) {
    normalTotalAmount = value;
  }

  String? get getBoxTotalQuantity => boxTotalQuantity;

  set setBoxTotalQuantity(String value) {
    boxTotalQuantity = value;
  }

  String? get getBottleTotalQuantity => bottleTotalQuantity;

  set setBottleTotalQuantity(String value) {
    bottleTotalQuantity = value;
  }

  String? get getTotalAmount => totalAmount;

  set setTotalAmount(String value) {
    totalAmount = value;
  }
}

List<SalesDailyDivisionModel> generateSalesDailyDivisionList(dataList, count) {
  var f = NumberFormat('###,###,###,###');
  return List.generate(
      count ~/ 2,
      (index) => SalesDailyDivisionModel(
          dataList[index].itemCode,
          dataList[index].itemName,
          dataList[index].usageCode,
          dataList[index].usageName,
          dataList[index].boxQuantity,
          dataList[index].bottleQuantity,
          dataList[index].amount,
          dataList[index].pleasureBoxTotalQuantity,
          dataList[index].pleasureBottleTotalQuantity,
          dataList[index].pleasureTotalAmount,
          dataList[index].normalBoxTotalQuantity,
          dataList[index].normalBottleTotalQuantity,
          dataList[index].normalTotalAmount,
          dataList[index].boxTotalQuantity,
          dataList[index].bottleTotalQuantity,
          dataList[index].totalAmount,
          id: index));
}
