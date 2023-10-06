import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sales_rank_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesRankModel {
  String? ranking;          //랭크
  String? customerCode;     //거래처코드
  String? customerName;     //거래처명
  String? salesAmount;      //매출액
  String? supplementAmount; //매출공급가
  String? profitAmount;     //매출이익
  String? profitRate;       //마진율
  String? bondBalance;      //채권잔액
  String? totalAmount;      //총금액
  int? id;

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
    {this.id}
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

List<SalesRankModel> generateSalesRankList(dataList, count) {
  var f = NumberFormat('###,###,###,###');
  return List.generate(
      count,
      (index) => SalesRankModel(
          dataList[index].ranking,
          dataList[index].customerCode,
          dataList[index].customerName,
          f.format(int.parse(dataList[index].salesAmount ?? '0')),
          f.format(int.parse(dataList[index].supplementAmount ?? '0')),
          f.format(int.parse(dataList[index].profitAmount ?? '0')),
          dataList[index].profitRate,
          f.format(int.parse(dataList[index].bondBalance ?? '0')),
          f.format(int.parse(dataList[index].totalAmount ?? '0')),
          id: index));
}
