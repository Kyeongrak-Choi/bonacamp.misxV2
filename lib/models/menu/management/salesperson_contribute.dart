import 'package:json_annotation/json_annotation.dart';

part 'salesperson_contribute.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class SalesPersonContributeModel {
  var customerCount; // 거래처수
  var salesAmount; // 공급가
  var purchaseAmount; // 매입가
  var marginRate; // 마진율
  var margin; // 매출 이익
  var managementCost; // 관리비용
  var financeCost; // 금융비용
  var fixCost; // 자산수리비
  var costTotal; //비용 합계
  var balance; // 채권 잔액
  var rentalBalance; // 대여금 잔액
  var rentalCount; // 대여자산
  var rentalQuantity; // 대여자산수량
  var serveRate; // 기여비율
  var expenseQuantity; // 소비자산수량
  var serveAmount; // 기여금액
  var serveTotal; // 기여금액 총합계

  SalesPersonContributeModel(
      this.customerCount,
      this.salesAmount,
      this.purchaseAmount,
      this.marginRate,
      this.margin,
      this.managementCost,
      this.financeCost,
      this.fixCost,
      this.costTotal,
      this.balance,
      this.rentalBalance,
      this.rentalCount,
      this.rentalQuantity,
      this.serveRate,
      this.expenseQuantity,
      this.serveAmount,
      this.serveTotal);

  Map<String, dynamic> toMap() {
    return {
      'customer-count': customerCount,
      'sales-amount': salesAmount,
      'purchase-amount': purchaseAmount,
      'margin-rate': marginRate,
      'margin': margin,
      'management-cost': managementCost,
      'finance-cost': financeCost,
      'fix-cost': fixCost,
      'cost-total': costTotal,
      'balance': balance,
      'rental-balance': rentalBalance,
      'rental-count': rentalCount,
      'rental-quantity': rentalQuantity,
      'serve-rate': serveRate,
      'expense-quantity': expenseQuantity,
      'serve-amount': serveAmount,
      'serve-total': serveTotal,
    };
  }

  factory SalesPersonContributeModel.fromJson(Map<String, dynamic> json) => _$SalesPersonContributeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPersonContributeModelToJson(this);
}
