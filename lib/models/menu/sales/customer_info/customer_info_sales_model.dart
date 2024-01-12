import 'package:json_annotation/json_annotation.dart';

part 'customer_info_sales_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class CustomerInfoSalesModel {
  String? title;
  String? month;
  int salesAmount;
  int balance;

  CustomerInfoSalesModel(
      this.title, this.month, this.salesAmount, this.balance);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'month': month,
      'sales-amount': salesAmount,
      'balance': balance,
    };
  }

  factory CustomerInfoSalesModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoSalesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoSalesModelToJson(this);

  String? get getTitle => title;

  set setTitle(String value) {
    title = value;
  }

  String? get getMonth => month;

  set setMonth(String value) {
    month = value;
  }

  int get getSalesAmount => salesAmount;

  set setSalesAmount(int value) {
    salesAmount = value;
  }

  int get getBalance => balance;

  set setBalance(int value) {
    balance = value;
  }
}
