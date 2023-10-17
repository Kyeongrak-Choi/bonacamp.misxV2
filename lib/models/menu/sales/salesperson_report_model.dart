import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'salesperson_report_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesPersonReportModel {
  var branchCode; // 사업장코드
  var code; // 영업사원 코드
  var name; // 영업사원 명
  var total; // 매출액
  var price; // 공급가
  var amount; // 합계 (공급가 + 부가세)
  var deposit; // 입금액
  var balance; // 채권 잔액
  var margin; // 이익금액
  var marginRate; // 이익률
  int? id;

  SalesPersonReportModel(
      this.branchCode, this.code, this.name, this.total, this.price, this.amount, this.deposit, this.balance, this.margin, this.marginRate,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'branch-code': branchCode,
      'code': code,
      'name': name,
      'total': total,
      'price': price,
      'amount': amount,
      'deposit': deposit,
      'balance': balance,
      'margin': margin,
      'margin-rate': marginRate,
    };
  }

  factory SalesPersonReportModel.fromJson(Map<String, dynamic> json) => _$SalesPersonReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPersonReportModelToJson(this);

  String? get getBranchCode => branchCode;

  set setBranchCode(String value) {
    branchCode = value;
  }

  String? get getCode => code;

  set setCode(String value) {
    code = value;
  }

  String? get getName => name;

  set setName(String value) {
    name = value;
  }

  String? get getTotal => total;

  set setTotal(String value) {
    total = value;
  }

  String? get getPrice => price;

  set setPrice(String value) {
    price = value;
  }

  String? get getAmount => amount;

  set setAmount(String value) {
    amount = value;
  }

  String? get getDeposit => deposit;

  set setDeposit(String value) {
    deposit = value;
  }

  String? get getBalance => balance;

  set setBalance(String value) {
    balance = value;
  }

  String? get getMargin => margin;

  set setMargin(String value) {
    margin = value;
  }

  String? get getMarginRate => marginRate;

  set setMarginRate(String value) {
    marginRate = value;
  }
}

List<SalesPersonReportModel> generateSalesPersonReportList(dataList, count) {
  return List.generate(
      count,
      (index) => SalesPersonReportModel(
            dataList[index].branchCode,
            dataList[index].code,
            dataList[index].name,
            numberFormat.format(dataList[index].total),
            numberFormat.format(dataList[index].price),
            numberFormat.format(dataList[index].amount),
            numberFormat.format(dataList[index].deposit),
            numberFormat.format(dataList[index].balance),
            numberFormat.format(dataList[index].margin),
            dataList[index].marginRate,
            id: index,
          ));
}
