import 'package:json_annotation/json_annotation.dart';

part 'sales_rank_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesRankModel {
  String? ranking;
  String? customerCode;
  String? customerName;
  String? salesAmount;
  String? supplementAmount;
  String? profitAmount;
  String? profitRate;
  String? bondBalance;
  String? totalAmount;

  SalesRankModel(
      this.ranking,
      this.customerCode,
      this.customerName,
      this.salesAmount,
      this.supplementAmount,
      this.profitAmount,
      this.profitRate,
      this.bondBalance,
      this.totalAmount,
      );


  Map<String, dynamic> toMap() {
    return {
      'ranking': ranking,
      'customer-code': customerCode,
      'customer-name': customerName,
      'sales-amount': salesAmount,
      'supplement-amount': supplementAmount,
      'profit-amount': profitAmount,
      'profit-rate': profitRate,
      'bond-balance': bondBalance,
      'total-amount': totalAmount,
    };
  }

  factory SalesRankModel.fromJson(Map<String, dynamic> json) => _$SalesRankModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesRankModelToJson(this);

  String? get getRanking => ranking;

  set setRanking(String value) {
    ranking = value;
  }

  String? get getCustomerCode => customerCode;

  set setCustomerCode(String value) {
    customerCode = value;
  }

  String? get getCustomerName => customerName;

  set setCustomerName(String value) {
    customerName = value;
  }

  String? get getSalesAmount => salesAmount;

  set setSalesAmount(String value) {
    salesAmount = value;
  }

  String? get getSupplementAmount => supplementAmount;

  set setSupplementAmount(String value) {
    supplementAmount = value;
  }

  String? get getProfitAmount => profitAmount;

  set setProfitAmount(String value) {
    profitAmount = value;
  }

  String? get getProfitRate => profitRate;

  set setProfitRate(String value) {
    profitRate = value;
  }

  String? get getBondBalance => bondBalance;

  set setBondBalance(String value) {
    bondBalance = value;
  }

  String? get getTotalAmount => totalAmount;

  set setTotalAmount(String value) {
    totalAmount = value;
  }
}
