import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'customer_report_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class CustomerReportModel {
  var branchCode; // 사업장코드
  var customerCode; // 영업사원 코드
  var customerName; // 영업사원 명
  var price; // 공급가
  var amount; // 합계 (공급가 + 부가세)
  var total; // 매출액
  var deposit; // 입금액
  var balance; // 채권 잔액
  var margin; // 이익금액
  var marginRate; // 이익률
  int? id;

  CustomerReportModel(
      this.branchCode, this.customerCode, this.customerName, this.total, this.price, this.amount, this.deposit, this.balance, this.margin, this.marginRate,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'branch-code': branchCode,
      'customer-code': customerCode,
      'customer-name': customerName,
      'total': total,
      'price': price,
      'amount': amount,
      'deposit': deposit,
      'balance': balance,
      'margin': margin,
      'margin-rate': marginRate,
    };
  }

  factory CustomerReportModel.fromJson(Map<String, dynamic> json) => _$CustomerReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerReportModelToJson(this);

  String? get getBranchCode => branchCode;

  set setBranchCode(String value) {
    branchCode = value;
  }

  String? get getCode => customerCode;

  set setCode(String value) {
    customerCode = value;
  }

  String? get getName => customerName;

  set setName(String value) {
    customerName = value;
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

List<CustomerReportModel> generateCustomerReportList(dataList, count) {
  return List.generate(
      count,
          (index) => CustomerReportModel(
        dataList[index].branchCode,
        dataList[index].customerCode,
        dataList[index].customerName,
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
