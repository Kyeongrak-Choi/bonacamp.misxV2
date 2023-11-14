import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'balance_report_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class BalanceReportModel {
  var code; // 거래처 코드
  var name; // 거래처 명
  var total; // 매출액
  var price; // 공급가
  var amount; // 합계 (공급가 + 부가세)
  var deposit; // 입금액
  var balance; // 채권 잔액
  var margin; // 이익금액
  var marginRate; // 이익률
  int? id;

  BalanceReportModel(this.code, this.name, this.total, this.price, this.amount, this.deposit, this.balance, this.margin, this.marginRate, {this.id});

  Map<String, dynamic> toMap() {
    return {
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

  factory BalanceReportModel.fromJson(Map<String, dynamic> json) => _$BalanceReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceReportModelToJson(this);

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

List<BalanceReportModel> generateBalanceReportList(dataList, count) {
  return List.generate(
      count,
      (index) => BalanceReportModel(
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
