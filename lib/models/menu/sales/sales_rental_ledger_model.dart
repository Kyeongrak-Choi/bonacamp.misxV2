import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'sales_rental_ledger_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesRentalLedgerModel {
  var salesDate; // 매출 일자
  var memo; // 적요
  var total; // 합계
  var price; // 공급가
  var amount; // 공급가 + 부가세
  var deposit; // 입금액
  var balance; // 채권 잔액
  var longRent; // 장기 대여금
  var shortRent; // 단기 대여금
  var totalRent; // 대여금 합계
  var totalBalance; // 채권잔액 + 대여금 합계
  int? id;

  SalesRentalLedgerModel(
      this.salesDate,
      this.memo,
      this.total,
      this.price,
      this.amount,
      this.deposit,
      this.balance,
      this.longRent,
      this.shortRent,
      this.totalRent,
      this.totalBalance,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'sales-date': salesDate,
      'memo': memo,
      'total': total,
      'price': price,
      'amount': amount,
      'deposit': deposit,
      'balance': balance,
      'long-rent': longRent,
      'short-rent': shortRent,
      'total-rent': totalRent,
      'total-balance': totalBalance,
    };
  }

  factory SalesRentalLedgerModel.fromJson(Map<String, dynamic> json) =>
      _$SalesRentalLedgerModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesRentalLedgerModelToJson(this);

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
}

List<SalesRentalLedgerModel> generateSalesRentalLedgerList(dataList, count) {
  return List.generate(
      count,
      (index) => SalesRentalLedgerModel(
            dataList[index].salesDate,
            dataList[index].memo,
            numberFormat.format(dataList[index].total),
            numberFormat.format(dataList[index].price),
            numberFormat.format(dataList[index].amount),
            numberFormat.format(dataList[index].deposit),
            numberFormat.format(dataList[index].balance),
            numberFormat.format(dataList[index].longRent),
            numberFormat.format(dataList[index].shortRent),
            numberFormat.format(dataList[index].totalRent),
            numberFormat.format(dataList[index].totalBalance),
            id: index,
          ));
}
