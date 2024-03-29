import 'package:json_annotation/json_annotation.dart';

part 'customer_contribute_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class CustomerContributeModel {
  var supplementAmount; // 팀코드
  var purchaseAmount; // 팀명
  var profitRate; // 영업사원코드
  var profitAmount; // 영업사원명
  var managementTotalAmount; // 구분값 (1:일 / 2:월)
  var financeAmount; // 구분명
  var assetFixAmount; // 공급가
  var total; // 부가세
  var bondBalance; // 공병보증금
  var rentalBalance; // 총합계
  var rentalAmount; // 매출원가
  var rentalAssetQuantity; // 이익금
  var contributeAmount; // 마진율 시스템 기준설정 A900 : 1.(마진액/매출원가)*100,  2.(마진액/공급가액)*100)
  var customerCount; // 현금입금
  var managementAmount; // 용기,공병입금
  var consumptionAssetQuantity; // 입금합계
  var startDate; // 전월/금일채권잔액
  var lastDate; // 전월/금일채권잔액

  CustomerContributeModel(
    this.supplementAmount,
    this.purchaseAmount,
    this.profitRate,
    this.profitAmount,
    this.managementTotalAmount,
    this.financeAmount,
    this.assetFixAmount,
    this.total,
    this.bondBalance,
    this.rentalBalance,
    this.rentalAmount,
    this.rentalAssetQuantity,
    this.contributeAmount,
    this.customerCount,
    this.managementAmount,
    this.consumptionAssetQuantity,
    this.startDate,
    this.lastDate,
  );

  Map<String, dynamic> toMap() {
    return {
      'supplement-amount': supplementAmount,
      'purchase-amount': purchaseAmount,
      'profit-rate': profitRate,
      'profit-amount': profitAmount,
      'management-total-amount': managementTotalAmount,
      'finance-amount': financeAmount,
      'asset-fix-amount': assetFixAmount,
      'total': total,
      'bond-balance': bondBalance,
      'rental-balance': rentalBalance,
      'rental-amount': rentalAmount,
      'rental-asset-quantity': rentalAssetQuantity,
      'contribute-amount': contributeAmount,
      'customer-count': customerCount,
      'management-amount': managementAmount,
      'consumption-asset-quantity': consumptionAssetQuantity,
      'start-date': startDate,
      'last-date': lastDate,
    };
  }

  factory CustomerContributeModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerContributeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerContributeModelToJson(this);

  String? get getSupplementAmount => supplementAmount;

  set setSupplementAmount(String value) {
    supplementAmount = value;
  }

  String? get getPurchaseAmount => purchaseAmount;

  set setPurchaseAmount(String value) {
    purchaseAmount = value;
  }

  String? get getProfitRate => profitRate;

  set setProfitRate(String value) {
    profitRate = value;
  }

  String? get getProfitAmount => profitAmount;

  set setProfitAmount(String value) {
    profitAmount = value;
  }

  String? get getManagementTotalAmount => managementTotalAmount;

  set setManagementTotalAmount(String value) {
    managementTotalAmount = value;
  }

  String? get getFinanceAmount => financeAmount;

  set setFinanceAmount(String value) {
    financeAmount = value;
  }

  String? get getAssetFixAmount => assetFixAmount;

  set setAssetFixAmount(String value) {
    assetFixAmount = value;
  }

  String? get getCostTotal => total;

  set setCostTotal(String value) {
    total = value;
  }

  String? get getBondBalance => bondBalance;

  set setBondBalance(String value) {
    bondBalance = value;
  }

  String? get getRentalBalance => rentalBalance;

  set setRentalBalance(String value) {
    rentalBalance = value;
  }

  String? get getRentalAmount => rentalAmount;

  set setRentalAmount(String value) {
    rentalAmount = value;
  }

  String? get getRentalAssetQuantity => rentalAssetQuantity;

  set setRentalAssetQuantity(String value) {
    rentalAssetQuantity = value;
  }

  String? get getContributeAmount => contributeAmount;

  set setContributeAmount(String value) {
    contributeAmount = value;
  }

  String? get getCustomerCount => customerCount;

  set setCustomerCount(String value) {
    customerCount = value;
  }

  String? get getManagementAmount => managementAmount;

  set setManagementAmount(String value) {
    managementAmount = value;
  }

  String? get getConsumptionAssetQuantity => consumptionAssetQuantity;

  set setConsumptionAssetQuantity(String value) {
    consumptionAssetQuantity = value;
  }

  String? get getStartDate => startDate;

  set setStartDate(String value) {
    startDate = value;
  }

  String? get getLastDate => lastDate;

  set setLastDate(String value) {
    lastDate = value;
  }
}
