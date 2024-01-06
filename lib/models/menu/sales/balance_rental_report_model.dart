import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'balance_rental_report_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class BalanceRentalReportModel {
  var code; // 거래처코드
  var name; // 거래처명
  var total; // 매출액
  var price; // 공급가
  var amount; // 소계 금액
  var deposit; // 입금액
  var balance; // 채권 잔액
  var longRent; // 장기 대여금
  var shortRent; // 단기 대여금
  var totalRent; // 대여금 합계
  var totalBalance; // 채권 잔액 + 대여금 합계
  var rentQuantity; // 대여 자산 수량
  var consumeQuantity; // 소비 자산 수량
  var margin; // 이익 금액
  var marginRate; // 이익률
  int? id;

  BalanceRentalReportModel(
      this.code,
      this.name,
      this.total,
      this.price,
      this.amount,
      this.deposit,
      this.balance,
      this.longRent,
      this.shortRent,
      this.totalRent,
      this.totalBalance,
      this.rentQuantity,
      this.consumeQuantity,
      this.margin,
      this.marginRate,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'total': total,
      'price': price,
      'amount': amount,
      'deposit': deposit,
      'balance': balance,
      'long-rent': longRent,
      'short-rent': shortRent,
      'total-rent': totalRent,
      'total-balance': totalBalance,
      'rent-quantity': rentQuantity,
      'consume-quantity': consumeQuantity,
      'margin': margin,
      'margin-rate': marginRate,
    };
  }

  factory BalanceRentalReportModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceRentalReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceRentalReportModelToJson(this);

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

List<BalanceRentalReportModel> generateBalanceRentalReportList(
    dataList, count) {
  return List.generate(
      count,
      (index) => BalanceRentalReportModel(
            dataList[index].code,
            dataList[index].name,
            numberFormat.format(dataList[index].total),
            numberFormat.format(dataList[index].price),
            numberFormat.format(dataList[index].amount),
            numberFormat.format(dataList[index].deposit),
            numberFormat.format(dataList[index].balance),
            numberFormat.format(dataList[index].longRent),
            numberFormat.format(dataList[index].shortRent),
            numberFormat.format(dataList[index].totalRent),
            numberFormat.format(dataList[index].totalBalance),
            numberFormat.format(dataList[index].rentQuantity),
            numberFormat.format(dataList[index].consumeQuantity),
            numberFormat.format(dataList[index].margin),
            dataList[index].marginRate,
            id: index,
          ));
}
